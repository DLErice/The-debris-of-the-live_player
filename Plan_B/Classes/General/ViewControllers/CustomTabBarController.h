//
//  CustomTabBarController.h
//  OneTargetCommon
//
//  Created by DLErice on 12/23/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UITabBarController

@property (nonatomic, copy) BOOL (^shouldSelectViewControllerBlock)(NSInteger index, UIViewController *viewController);

@end
