//
//  AlertHelper.m
//  OneTargetCommon
//
//  Created by DLErice on 1/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper

- (void)addAction:(nullable NSString *)actionTitle style:(UIAlertActionStyle)style handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                     style:style
                                                   handler:actionBlock];

    [self addAction:action];
}

- (void)addDefaultAction:(nullable NSString *)actionTitle handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock
{
    [self addAction:actionTitle style:UIAlertActionStyleDefault handler:actionBlock];
}

- (void)addDestructiveAction:(nullable NSString *)actionTitle handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock
{
    [self addAction:actionTitle style:UIAlertActionStyleDestructive handler:actionBlock];
}

- (void)presentInViewController:(nonnull UIViewController *)sourceViewController
{
    NSParameterAssert(sourceViewController);

    [sourceViewController presentViewController:self animated:YES completion:nil];
}

@end
