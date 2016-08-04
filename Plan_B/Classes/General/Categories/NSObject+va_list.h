//
//  NSObject+va_list.h
//  OneTargetCommon
//
//  Created by DLErice on 2/23/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (va_list)

+ (void)apply:(void (^)(id))block forObjects:(id)firstObject, ...NS_REQUIRES_NIL_TERMINATION;

@end
