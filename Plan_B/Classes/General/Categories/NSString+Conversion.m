//
//  NSString+Conversion.m
//  OneTargetCommon
//
//  Created by DLErice on 1/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "NSString+Conversion.h"
#import "pinyin.h"

@implementation NSString (Conversion)

- (char)firstPinYinChar
{
    unichar firstLetter = [self characterAtIndex:0];
    return pinyinFirstLetter(firstLetter);
}

- (NSString *)uppercasePinYinFirstLetter
{
    char cFirstLetter = [self firstPinYinChar];

    return [[NSString stringWithFormat:@"%c", cFirstLetter] uppercaseString];
}

- (NSString *)lowercasePinYinFirstLetter
{
    char cFirstLetter = [self firstPinYinChar];

    return [[NSString stringWithFormat:@"%c", cFirstLetter] lowercaseString];
}

@end
