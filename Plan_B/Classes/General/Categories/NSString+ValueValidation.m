//
//  NSString+ValueValidation.m
//  OneTargetCommon
//
//  Created by DLErice on 1/19/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "NSString+ValueValidation.h"

@implementation NSString (ValueValidation)

- (BOOL)isNullOrEmpty
{
    return [self isEqual:[NSNull null]] || [self isEqualToString:@""];
}

- (NSString *)trimEmptySpace
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    return trimmedString;
}

@end
