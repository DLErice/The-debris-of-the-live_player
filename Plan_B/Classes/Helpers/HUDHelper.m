//
//  HUDHelper.m
//  OneTargetCommon
//
//  Created by DLErice on 1/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "HUDHelper.h"

#define kROOTVIEW_WINDOW    [UIApplication sharedApplication].delegate.window.rootViewController.view


@implementation HUDHelper

#pragma mark - Indicator

+ (MBProgressHUD *)showIndicatorToView:(UIView *)view
{
    return [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+ (MBProgressHUD *)showIndicatorToView:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *hud = [self showIndicatorToView:view];

    hud.labelText = text;
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

+ (MBProgressHUD *)showHUDIndicatorInWindow
{
    return [self showIndicatorToView:kROOTVIEW_WINDOW];
}

#pragma mark - HUD

+ (MBProgressHUD *)showHUDInView:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *hud = [self showIndicatorToView:view];

    hud.labelText = text;
    hud.mode = MBProgressHUDModeText;
    hud.margin = 15.f;
    [hud hide:YES afterDelay:2];
    return hud;
}

+ (MBProgressHUD *)showHUDTextInWindow:(NSString *)text
{
    return [self showHUDInView:kROOTVIEW_WINDOW text:text];
}

+ (void)showHUDInView:(UIView *)view completedText:(NSString *)text
{
    MBProgressHUD *hud = [self showIndicatorToView:view];

    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = text;
    [hud hide:YES afterDelay:1];
}

#pragma mark - hidden

+ (void)hideHUDInView:(UIView *)view completedText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];

    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = text;
    [hud hide:YES afterDelay:1];
}

+ (void)hideHUDForView:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

+ (void)hideHUDForWindow
{
    [MBProgressHUD hideAllHUDsForView:kROOTVIEW_WINDOW animated:YES];
}

@end
