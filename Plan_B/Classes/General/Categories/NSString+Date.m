//
//  NSString+Date.m
//  OneTargetCommon
//
//  Created by DLErice on 3/7/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

#pragma mark - Class Methods

+ (NSString *)stringFromDate:(NSDate *)date
{
    return [self stringFromDate:date dateFormat:kSTRKey_DateFormat_Date];
}

+ (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:date];

    return dateString;
}

+ (NSDate *)dateFromString:(NSString *)string
{
    return [self dateFromString:string dateFormat:kSTRKey_DateFormat_Date];
}

+ (NSDate *)dateFromString:(NSString *)string dateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateFormat:format];

    return [formatter dateFromString:string];
}

#pragma mark - Instance Methods

- (NSDate *)dateFromString
{
    return [self dateFromStringFormat:kSTRKey_DateFormat_Date];
}

- (NSDate *)dateFromStringFormat:(NSString *)format
{
    return [[self class] dateFromString:self dateFormat:format];
}

@end
