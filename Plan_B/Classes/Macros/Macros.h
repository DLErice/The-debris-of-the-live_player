//
//  Macros.h
//  Plan_B
//
//  Created by DLErice on 16/5/13.
//  Copyright © 2016年 DLErice. All rights reserved.
//

// ------------------- Macros -------------------

#define LOADIMAGE(__image) [UIImage imageNamed : (__image)]

#define RGBA(__r, __g, __b, __a)           \
[UIColor colorWithRed : (__r / 255.0f) \
green : (__g / 255.0f)                \
blue : (__b / 255.0f)                 \
alpha : (__a)]

#define RGB(__r, __g, __b) RGBA(__r, __g, __b, 1.0)

#define SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT        [UIScreen mainScreen].bounds.size.height

#define IOS9_OR_LATER        ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)
