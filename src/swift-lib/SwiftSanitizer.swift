//
//  SwiftSanitizer.swift
//  xcode-runtime-sanitizer-demo
//
//  Created by Connor Wybranowski on 1/18/23.
//

import Foundation

public enum SwiftSanitizer {

    private static var value: String = "string"

    public static func triggerThreadSanitizer() {
        DispatchQueue.global().async {
            self.value.append("async")
        }
        _ = value
    }

    // [CW] 1/20/23 - Copied from:
    // https://github.com/buildbuddy-io/rules_xcodeproj/blob/main/examples/sanitizers/AddressSanitizerApp/AddressSanitizerExamples.swift#L9
    public static func triggerAddressSanitizer() {
        let pointer = UnsafeMutableRawPointer.allocate(
            byteCount: 1,
            alignment: 1
        )
        pointer.storeBytes(
            of: 1,
            as: UInt8.self
        )
        pointer.advanced(by: 1).storeBytes(
            of: 2,
            as: UInt8.self
        )
    }
}
