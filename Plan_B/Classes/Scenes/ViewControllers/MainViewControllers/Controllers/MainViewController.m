//
//  MainViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/13.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "MainViewController.h"
#import "EventViewController.h"
#import "LiveViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [self setViewChildControllers];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.122 alpha:1.000];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarButtonTapped:)];
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[LOADIMAGE(@"time-1") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightBarButtonTapped:)];
    self.navigationController.navigationBar.translucent = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:0.144 alpha:1.000];
}


- (void)leftBarButtonTapped:(id)sender
{
    DDLogInfo(@"left");
}
- (void)rightBarButtonTapped:(id)sender
{
    DDLogInfo(@"right");
}

- (void)setViewChildControllers {
    EventViewController *eventVC = [EventViewController new];
    LiveViewController *liveVC = [LiveViewController new];
    
    
    self.indicatorViewColor = [UIColor colorWithRed:0.843 green:0.651 blue:0.235 alpha:1.000];
    self.viewControllers = @[eventVC,liveVC];
    self.titleColor = [UIColor colorWithRed:0.843 green:0.651 blue:0.235 alpha:1.000];
    
    [self setTitles:@[@"活动",@"直播"]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
