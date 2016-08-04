//
//  HDNavigationSegementViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/17.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "HDNavigationSegementViewController.h"
#import "ScrollSegmentControl.h"

@interface HDNavigationSegementViewController () <UIScrollViewDelegate, ScrollSegmentControlDelegate>





@property (nonatomic, strong) ScrollSegmentControl * segment;
@property (nonatomic, assign) BOOL isDrag;
@property (nonatomic, assign) CGFloat vcWidth; // 每个子视图控制器的试图高度
@property (nonatomic, assign) CGFloat vcHeight;



@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation HDNavigationSegementViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setViewControllerss];
    
    [self setupScrollView];
    [self setupViewControllers];
    [self setupSegmentControl];
    
}

- (void)setViewControllerss {
//    EventViewController *eventVC = [EventViewController new];
//    eventVC.view.backgroundColor  = [UIColor redColor];
//    
//    LiveViewController *liveVC = [LiveViewController new];
//    self.segment.backgroundColor = [UIColor blackColor];
//    self.indicatorViewColor = [UIColor colorWithRed:0.765 green:0.000 blue:0.114 alpha:1.000];
//    self.viewControllers = @[eventVC,liveVC];
//    self.titleColor = [UIColor blackColor];
//    [self setTitles:@[@"活动",@"直播"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)itemWidth
{
    if (_itemWidth == 0) {
        _itemWidth = 60.0f;
    }
    return _itemWidth;
}

- (CGFloat)itemHeight
{
    if (_itemHeight == 0) {
        _itemHeight = 30.0f;
    }
    return _itemHeight;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

/** 设置scrollView */
- (void)setupScrollView
{
    CGFloat Y = 0.0f;
    self.vcWidth = self.view.frame.size.width;
    self.vcHeight = self.view.frame.size.height - Y;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, Y, self.vcWidth, self.vcHeight)];
    scrollView.contentSize = CGSizeMake(self.vcWidth * self.viewControllers.count, self.vcHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate      = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

/** 设置子视图控制器，这个方法必须在viewDidLoad方法里执行，否则子视图控制器各项属性为空 */
- (void)setupViewControllers
{
    int cnt = (int)self.viewControllers.count;
    for (int i = 0; i < cnt; i++) {
        UIViewController *vc = self.viewControllers[i];
        [self addChildViewController:vc];
        
        vc.view.frame = CGRectMake(self.vcWidth * i, 0, self.vcWidth, self.vcHeight);
        [self.scrollView addSubview:vc.view];
    }
}

/** 设置segment */
- (void)setupSegmentControl
{
    _itemWidth = 80.0f;
    // 设置titleView
    self.segment = [[ScrollSegmentControl alloc] initWithFrame:CGRectMake(0, 50, _itemWidth * 2, 45.0f)];
    self.segment.titles = self.titles;
    self.segment.cornerRadius = 5.0f;
    self.segment.titleColor = [UIColor whiteColor];//self.titleColor;
    self.segment.indicatorViewColor = self.indicatorViewColor;
    self.segment.backgroundColor = self.segmentBgColor;
    
    self.segment.delegate = self;
    self.navigationItem.titleView = self.segment;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.segment selectedBegan];
    _isDrag = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_isDrag) {
        CGFloat percent = scrollView.contentOffset.x / scrollView.contentSize.width;
        
        [self.segment setIndicatorViewPercent:percent];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate == NO) {
        [self.segment selectedEnd];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self.segment setSelectedIndex:index];
    _isDrag = NO;
}

#pragma mark - SegmentControlDelegate

- (void)segmentControl:(ScrollSegmentControl *)segment didSelectedIndex:(NSInteger)index {
    CGFloat X = index * self.view.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(X, 0) animated:YES];
}

@end
