//
//  CustomNavigationController.m
//  OneTargetCClient
//
//  Created by DLErice on 12/3/15.
//  Copyright © 2016 DLErice. All rights reserved.
//
//  Solution fix for custom left navigation bar disabled back swipe gesture:
//      http://keighl.com/post/ios7-interactive-pop-gesture-custom-back-button/
//      http://stackoverflow.com/questions/19054625/changing-back-button-in-ios-7-disables-swipe-to-navigate-back/20330647#20330647
//      http://www.cnblogs.com/angzn/p/3696901.html
//  References in future:
//      https://github.com/fastred/AHKNavigationController
//


#define InteractivePopGesture 1 // hack!


#import "CustomNavigationController.h"

@interface CustomNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation CustomNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {

//        self.navigationBar.tintColor = [UIColor whiteColor];
//        self.navigationBar.translucent = NO;
//        self.navigationBar.barTintColor = [UIColor colorWithWhite:0.144 alpha:1.000];
        self.delegate = self;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

#if InteractivePopGesture

    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }

#endif
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
#if InteractivePopGesture
    [self setInteractivePopGestureState:NO];
#endif

    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    DDLogWarn(@"View controller received some memory warnings. %@ - %s", self, __func__);
}

- (void)dealloc
{
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = nil;
}

#pragma mark - Private

#if InteractivePopGesture

- (void)setInteractivePopGestureState:(BOOL)state
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = state;
    }
}

#endif

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
#if InteractivePopGesture
    // Enable the gesture again once the new controller is shown except for root view controller.
    [self setInteractivePopGestureState:navigationController.viewControllers.count > 1];
#endif
}

@end
