//
//  ObjcSanitizer.m
//  xcode-runtime-sanitizer-demo
//
//  Created by Connor Wybranowski on 1/18/23.
//

#import <Foundation/Foundation.h>
#import "ObjcSanitizer.h"

@implementation ObjcSanitizer : NSObject

+ (void)triggerAddressSanitizer_example1 {
    char *buffer = malloc(80);
    buffer[80] = 'Y';
    free(buffer);
}

// [CW] 1/20/23 - Copied from:
// https://github.com/buildbuddy-io/rules_xcodeproj/issues/1613#issuecomment-1397907992
+ (int)triggerAddressSanitizer_example2 {
    volatile int* p;
      {
        volatile int x = 0;
        p = &x;
      }
      return *p;
}

@end
