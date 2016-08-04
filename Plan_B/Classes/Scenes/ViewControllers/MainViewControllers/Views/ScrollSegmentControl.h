//
//  ScrollSegmentControl.h
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface ScrollSegmentControl : UIView
@class ScrollSegmentControl;

#pragma mark - JRSegmentButton
@interface ScrollSegmentButton : UIButton

@end


#pragma mark - JRSegmentControlDelegate
@protocol ScrollSegmentControlDelegate <NSObject>

/** 选中某个按钮时的代理回调 */
- (void)segmentControl:(ScrollSegmentControl *)segment didSelectedIndex:(NSInteger)index;

@optional

/** 指示视图滑动进度的代理回调 */
- (void)segmentControl:(ScrollSegmentControl *)segment didScrolledPersent:(CGFloat)persent;

@end

#pragma mark - JRSegmentControl
@interface ScrollSegmentControl : UIView

/**
 *  按钮标题数组
 */
@property (nonatomic, copy) NSArray *titles;
/** 按钮圆角半径 */
@property (nonatomic, assign) CGFloat cornerRadius;
/** 指示视图的颜色 */
@property (nonatomic, strong) UIColor *indicatorViewColor;
/** 未选中时的按钮文字颜色 */
@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, weak) id<ScrollSegmentControlDelegate> delegate;

/** 设置segment的索引为index的按钮处于选中状态 */
- (void)setSelectedIndex:(NSInteger)index;

- (void)setIndicatorViewPercent:(CGFloat)percent;

/** 选开始的设置，指示视图变暗，字体颜色改变 */
- (void)selectedBegan;

/** 选开始的设置 */
- (void)selectedEnd;


@end
