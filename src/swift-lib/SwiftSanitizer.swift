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
}
