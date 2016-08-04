//
//  HDNavigationSegementViewController.h
//  Plan_B
//
//  Created by DLErice on 16/5/17.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDNavigationSegementViewController : UIViewController

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, copy) NSArray *titles;

@property (nonatomic, strong) UIColor *indicatorViewColor; //指示视图的颜色

@property (nonatomic, strong) UIColor *segmentBgColor; //segment的背景颜色

@property (nonatomic, strong) UIColor *titleColor; // segment每一项的文字颜色

@property (nonatomic, assign) CGFloat itemWidth; //segment每一项的宽

@property (nonatomic, assign) CGFloat itemHeight;  //segment每一项的高

@end
