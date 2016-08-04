//
//  NSString+Conversion.h
//  OneTargetCommon
//
//  Created by DLErice on 1/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Conversion)

- (char)firstPinYinChar;

- (NSString *)uppercasePinYinFirstLetter;

- (NSString *)lowercasePinYinFirstLetter;

@end
