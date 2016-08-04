//
//  UIImage+ColorHelper.h
//  OneTargetCommon
//
//  Created by DLErice on 1/4/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorHelper)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat)width height:(CGFloat)height;

@end

#define UIImageFromColor(__color__)                 [UIImage imageWithColor : (__color__)]
#define UIImageFromWidthColor(__color__, __width__) [UIImage imageWithColor : (__color__)width : (__width__)height : (__width__)]
