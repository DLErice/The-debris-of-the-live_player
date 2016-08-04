//
//  BaseViewController.h
//  OneTargetCClient
//
//  Created by DLErice on 12/3/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BACKGROUND_COLOR    RGB(241, 241, 241)

#define InitForViewController(__statement__)                                                       \
    - (instancetype)initWithNibName : (NSString *)nibNameOrNil bundle : (NSBundle *)nibBundleOrNil \
    {                                                                                              \
        if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {                   \
            {                                                                                      \
                __statement__                                                                      \
            }                                                                                      \
        }                                                                                          \
        return self;                                                                               \
    }

typedef void (^AppearAnimationBlock)(BOOL);

@class BaseViewController;

#pragma mark - BuildViewDelegate

@protocol BuildViewDelegate <NSObject>

- (void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController;

@end

#pragma mark - BaseViewController

@interface BaseViewController : UIViewController

@property (nonatomic, copy) AppearAnimationBlock willAppearBlock;
@property (nonatomic, copy) AppearAnimationBlock didAppearBlock;
@property (nonatomic, copy) AppearAnimationBlock willDisappearBlock;
@property (nonatomic, copy) AppearAnimationBlock didDisappearBlock;

- (void)pushViewController:(UIViewController *)viewController;
- (UIViewController *)popCurrentViewController; // with animation

@end

// Should use this as base type for children view controllers.
typedef BaseViewController<BuildViewDelegate>   BASEVIEWCONTROLLER;

/**
   Use for easy to copy

   #pragma mark - BuildViewDelegate

   - (void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController
   {
   }

 **/
