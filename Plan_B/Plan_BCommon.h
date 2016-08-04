//
//  Plan_BCommon.h
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef PrefixHeader_pch
#define PrefixHeader_pch

#define MAS_SHORTHAND
#import <Masonry/Masonry.h>

#import <libextobjc/extobjc.h>

#import <CocoaLumberjack/CocoaLumberjack.h>

#if DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelInfo;
#endif

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

// Used for building view constraints
#define OTLabelHeightPerLine 26


#if DEBUG
#define FLEX                 1
#endif

#define DEMOUI               1 // marker for some demo/temporary UI elements.

#define OTDEV                1 // changes made by OneTarget developers.

#define kStudentEvaluation   0   // Disabled temporarily!

#define DEMO_PLAN_B          1 //if demo don't usr netWorking 

// --------------------- Types ---------------------

typedef void (^OTActionBlock)(void);
typedef void (^OTActionWithStatusBlock)(BOOL);
typedef void (^OTActionWithIntBlock)(NSInteger);
typedef void (^OTActionWithIndexBlock)(NSIndexPath *, NSString *);

// ------------------- Variables -------------------

static BOOL IsPad;



// ------------------- Functions -------------------


#endif /* PrefixHeader_pch */

