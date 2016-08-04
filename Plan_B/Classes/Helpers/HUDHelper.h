//
//  HUDHelper.h
//  OneTargetCommon
//
//  Created by DLErice on 1/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface HUDHelper : UIView

#pragma mark - Indicator

+ (MBProgressHUD *)showIndicatorToView:(UIView *)view;

+ (MBProgressHUD *)showIndicatorToView:(UIView *)view text:(NSString *)text;

+ (MBProgressHUD *)showHUDIndicatorInWindow;

#pragma mark - HUD

+ (MBProgressHUD *)showHUDInView:(UIView *)view text:(NSString *)text;

+ (MBProgressHUD *)showHUDTextInWindow:(NSString *)text;

+ (void)showHUDInView:(UIView *)view completedText:(NSString *)text;

#pragma mark - hidden

+ (void)hideHUDInView:(UIView *)view completedText:(NSString *)text;

+ (void)hideHUDForView:(UIView *)view;

+ (void)hideHUDForWindow;

@end
