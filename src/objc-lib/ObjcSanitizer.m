//
//  ObjcSanitizer.m
//  xcode-runtime-sanitizer-demo
//
//  Created by Connor Wybranowski on 1/18/23.
//

#import <Foundation/Foundation.h>
#import "ObjcSanitizer.h"

@implementation ObjcSanitizer : NSObject

+ (void)triggerAddressSanitizer {
    char *buffer = malloc(80);
    buffer[80] = 'Y';
    free(buffer);
}

@end
