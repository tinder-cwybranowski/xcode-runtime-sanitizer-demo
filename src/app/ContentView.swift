//
//  ContentView.swift
//  xcode-runtime-sanitizer-demo
//
//  Created by Connor Wybranowski on 1/18/23.
//

import ObjcLib
import SwiftLib
import SwiftUI

struct Example: Identifiable {

    enum ExampleType {
        case addressSanitizer, threadSanitizer

        var infoLog: String {
            switch self {
            case .addressSanitizer:
                return """
                    Triggering Address Sanitizer...
                    ** Ensure 'Product > Scheme > Edit Scheme > Run > Diagnostics > Address Sanitizer' is enabled to see expected tracing.
                    """
            case .threadSanitizer:
                return """
                    Triggering Thread Sanitizer...
                    ** Ensure 'Product > Scheme > Edit Scheme > Run > Diagnostics > Thread Sanitizer' is enabled to see expected tracing.
                    """
            }
        }
    }

    var fullTitle: String {
        "Trigger \(type): \(title)"
    }

    var color: Color {
        switch type {
        case .addressSanitizer:
            return .blue
        case .threadSanitizer:
            return .red
        }
    }

    let id: UUID = .init()
    let type: ExampleType
    let title: String
    let invocation: () -> Void
}

struct ContentView: View {

    private let examples: [Example] = [
        .init(
            type: .threadSanitizer,
            title: "Swift"
        ) {
            SwiftSanitizer.triggerThreadSanitizer()
        },
        .init(
            type: .addressSanitizer,
            title: "Swift"
        ) {
            SwiftSanitizer.triggerAddressSanitizer()
        },
        .init(
            type: .addressSanitizer,
            title: "Objc 1"
        ) {
            ObjcSanitizer.triggerAddressSanitizer_example1()
        },
        .init(
            type: .addressSanitizer,
            title: "Objc 2"
        ) {
            ObjcSanitizer.triggerAddressSanitizer_example2()
        }
    ]

    var body: some View {
        VStack {
            Text("Sanitizer Example")
            ForEach(examples) { example in
                Button(example.fullTitle) {
                    print(example.type.infoLog)
                    example.invocation()
                }
                .foregroundColor(example.color)
            }
        }
        .padding()
    }
}
