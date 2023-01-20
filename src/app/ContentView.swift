//
//  ContentView.swift
//  xcode-runtime-sanitizer-demo
//
//  Created by Connor Wybranowski on 1/18/23.
//

import ObjcLib
import SwiftLib
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Sanitizer Example")
            Button("Trigger Thread Sanitizer") {
                print("""
                Triggering Thread Sanitizer...
                ** Ensure 'Product > Scheme > Edit Scheme > Run > Diagnostics > Thread Sanitizer' is enabled to see expected tracing.
                """)
                SwiftSanitizer.triggerThreadSanitizer()
            }
            .foregroundColor(.blue)
            Button("Trigger Address Sanitizer (Objc)") {
                print("""
                Triggering Address Sanitizer...
                ** Ensure 'Product > Scheme > Edit Scheme > Run > Diagnostics > Address Sanitizer' is enabled to see expected tracing.
                """)
                ObjcSanitizer.triggerAddressSanitizer()
            }
            .foregroundColor(.red)
            Button("Trigger Address Sanitizer (Swift)") {
                print("""
                Triggering Address Sanitizer...
                ** Ensure 'Product > Scheme > Edit Scheme > Run > Diagnostics > Address Sanitizer' is enabled to see expected tracing.
                """)
                SwiftSanitizer.triggerAddressSanitizer()
            }
            .foregroundColor(.green)
        }
        .padding()
    }
}
