//
//  AlertHelper.h
//  OneTargetCommon
//
//  Created by DLErice on 1/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertHelper : UIAlertController

- (void)addAction:(nullable NSString *)actionTitle style:(UIAlertActionStyle)style handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock;

- (void)addDefaultAction:(nullable NSString *)actionTitle handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock;

- (void)addDestructiveAction:(nullable NSString *)actionTitle handler:(void (^__nullable)(UIAlertAction * __nullable action))actionBlock;

- (void)presentInViewController:(nonnull UIViewController *)sourceViewController;

@end
