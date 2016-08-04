//
//  AttentionViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/13.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "AttentionViewController.h"
#import "UIView+HRExtention.h"
#import "ActivityTableView.h"
#import "ArtistAttentionTableView.h"

@interface AttentionViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:0.144 alpha:1.000];
    [self settingSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    
    self.segment.selectedSegmentIndex = offset/SCREEN_WIDTH;
}

- (void)settingSegment{
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"活动",@"艺人"]];
    segment.tintColor = [UIColor colorWithRed:0.890 green:0.690 blue:0.255 alpha:1.000];
    self.navigationItem.titleView = segment;
    segment.width = 120;
    segment.selectedSegmentIndex = 0;
    
    [segment addTarget:self action:@selector(segmentBtnClick) forControlEvents:UIControlEventValueChanged];
    _segment = segment;
    
    
}

- (void)segmentBtnClick{
    self.scrollView.contentOffset = CGPointMake(self.segment.selectedSegmentIndex * self.view.frame.size.width, 64);
}


- (void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController {
    
    ActivityTableView *tableView = [[ActivityTableView alloc] initWithFrame:CGRectMake(0,64, containerView.frame.size.width, containerView.frame.size.height-49-64) style:(UITableViewStylePlain)];
 
    
    ArtistAttentionTableView *tableViewOne = [[ArtistAttentionTableView alloc] initWithFrame:CGRectMake(containerView.frame.size.width,64, containerView.frame.size.width, containerView.frame.size.height-49-64) style:(UITableViewStylePlain)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height)];
    
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    
    scrollView.contentInset = UIEdgeInsetsMake(-64, 0, -49, 0);
    scrollView.contentSize = CGSizeMake(2 *containerView.frame.size.width, containerView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    [containerView addSubview:scrollView];
    [scrollView addSubview:tableView];
    [scrollView addSubview:tableViewOne];
    _scrollView = scrollView;
    
}


@end
