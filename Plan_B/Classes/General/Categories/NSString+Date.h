//
//  NSString+Date.h
//  OneTargetCommon
//
//  Created by DLErice on 3/7/16.
//  Copyright © 2016 onetarget. All rights reserved.
//
//  References URL: http://www.superqq.com/blog/2015/06/26/nsdatehe-nsstringxiang-hu-zhuan-huan
//

#import <Foundation/Foundation.h>

#define kSTRKey_DateFormat_Date_Time_MiniSecond @"yyyy-MM-dd HH:mm:ss.SSS"
#define kSTRKey_DateFormat_Date_Time_Second     @"yyyy-MM-dd HH:mm:ss"
#define kSTRKey_DateFormat_Date                 @"yyyy-MM-dd"
#define kSTRKey_DateFormat_Time                 @"MM dd yyyy"


@interface NSString (Date)

#pragma mark - Class Methods

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)format;

+ (NSDate *)dateFromString:(NSString *)string;

+ (NSDate *)dateFromString:(NSString *)string dateFormat:(NSString *)format;

#pragma mark - Instance Methods

- (NSDate *)dateFromString;

- (NSDate *)dateFromStringFormat:(NSString *)format;

@end
