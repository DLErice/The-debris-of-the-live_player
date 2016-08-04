//
//  UIView+ViewHierarchy.h
//  OneTargetCommon
//
//  Created by DLErice on 1/19/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewHierarchy)

- (void)addSubviews:(UIView *)firstView, ... NS_REQUIRES_NIL_TERMINATION;

@end
