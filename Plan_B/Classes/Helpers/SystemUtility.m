//
//  SystemUtility.m
//  OneTargetCommon
//
//  Created by DLErice on 2/21/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "SystemUtility.h"

@implementation SystemUtility

+ (BOOL)callPhone:(NSString *)phoneNumber
{
    NSParameterAssert(phoneNumber.length > 0);

    // http://stackoverflow.com/a/33393195/1677041

    NSURL *phoneUrl = [NSURL URLWithString:[@"telprompt://" stringByAppendingString:phoneNumber]];
    NSURL *phoneFallbackUrl = [NSURL URLWithString:[@"tel://" stringByAppendingString:phoneNumber]];

    if ([UIApplication.sharedApplication canOpenURL:phoneUrl]) {
        [UIApplication.sharedApplication openURL:phoneUrl];
    } else if ([UIApplication.sharedApplication canOpenURL:phoneFallbackUrl]) {
        [UIApplication.sharedApplication openURL:phoneFallbackUrl];
    } else {
        DDLogError(@"Couldn't handle the phone call URLs");
        return NO;
    }

    return YES;
}

@end
