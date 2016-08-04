//
//  ScrollableViewController.h
//  OneTargetCommon
//
//  Created by DLErice on 1/28/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "BaseViewController.h"

#pragma mark - ScrollableViewControllerDelegate

@protocol ScrollableViewControllerDelegate <NSObject>

- (void)buildScrollViewSubview:(UIView *)scrollView controller:(BaseViewController *)viewController;

@end

@interface ScrollableViewController : BaseViewController

@property (nonatomic, strong, readonly) UIView *containerView; // the subclass should add children view to this containerView.

// With autolayout(Masonry), the subclass should give a valid view to lastBottomView which is used for layout children views within scroll view.
@property (nonatomic, strong) UIView *lastBottomView;


// keyboard frame notification
@property (nonatomic, assign) BOOL observeKeyboardChanges; // default is NO
@property (nonatomic, copy) void (^keyboardChangedBlock)(CGRect beginRect, CGRect endRect); // converted to current window's coordinates.
@property (nonatomic, copy) void (^scrollContentSetBlock)(CGPoint currentPoint);


typedef ScrollableViewController<ScrollableViewControllerDelegate>   SCROLLABLEVIEWCONTROLLER;
@end
