//
//  MineViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/13.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "MineViewController.h"
#import <RETableViewManager/RETableViewManager.h>

@interface MineViewController ()<RETableViewManagerDelegate>
@property (nonatomic, strong) RETableViewManager *manager;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        //设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //设置透明消失
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    
}

#pragma mark - BuildViewDelegate

- (void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController
{
    
    UIImageView *headerView = [[UIImageView alloc] init];
    headerView.image = LOADIMAGE(@"bg");
    [containerView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(containerView.width);
        make.height.equalTo(@250);
        make.top.equalTo(containerView.top).offset(-64);
        make.left.equalTo(containerView.left);
    }];
    
    UIImageView *userImageView = [[UIImageView alloc] init];
    userImageView.layer.cornerRadius = 40;
    userImageView.image = LOADIMAGE(@"rentou_image");
//    userImageView.translatesAutoresizingMaskIntoConstraints = YES;
    userImageView.backgroundColor = [UIColor orangeColor];
    [headerView addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(headerView);
        make.centerX.equalTo(headerView.centerX);
        make.centerY.equalTo(headerView.centerY).offset(20);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
    }];
    
    
    UILabel *userNameLabel = [[UILabel alloc] init];
    userNameLabel.font = [UIFont boldSystemFontOfSize:17];
    userNameLabel.textColor = [UIColor colorWithRed:0.996 green:0.988 blue:0.988 alpha:1.000];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.text = @"宋仲基";
    [headerView addSubview:userNameLabel];
    [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.centerX);
        make.top.equalTo(userImageView.bottom).offset(5);
//        make.height.equalTo(@30);
        make.width.equalTo(containerView.width);
        
    }];
    
    
    UILabel *bLable = [[UILabel alloc] init];
    bLable.font = [UIFont systemFontOfSize:15];
    bLable.textColor = [UIColor colorWithRed:0.988 green:0.698 blue:0.004 alpha:1.000];
    bLable.textAlignment = NSTextAlignmentCenter;
    bLable.text = @"100个 YIKA币";
    [headerView addSubview:bLable];
    [bLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.centerX);
        make.top.equalTo(userNameLabel.bottom);
//        make.height.equalTo(@30);
        make.width.equalTo(containerView.width);
    }];
    
    CGFloat sectionSeparatorHeight = 8;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.sectionHeaderHeight = sectionSeparatorHeight;
    tableView.sectionFooterHeight = 0;
    tableView.backgroundColor = BACKGROUND_COLOR;
    [containerView addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(containerView.width);
        make.centerX.equalTo(containerView.centerX);
        make.top.equalTo(headerView.bottom);
        make.bottom.equalTo(containerView.bottom).offset(-6);
    }];

    
 

    
    self.manager = [[RETableViewManager alloc] initWithTableView:tableView];
    self.manager.delegate = self;
    
    self.manager.style.cellHeight = 50;
    
    RETableViewSection *section = nil;
    RETableViewItem *item = nil;
    
    section = [RETableViewSection section];
    item = [RETableViewItem itemWithTitle:@"YIKA币"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator                         selectionHandler:^(RETableViewItem *item) {
                             [item deselectRowAnimated:YES];
                         }];
    item.image = LOADIMAGE(@"YIKAbi");
    item.style = UITableViewCellStyleDefault;
    [section addItem:item];

    item = [RETableViewItem itemWithTitle:@"任务中心"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             [item deselectRowAnimated:YES];
                         }];
    item.image = LOADIMAGE(@"renwuzhongxin");
    item.style = UITableViewCellStyleValue1;
    [section addItem:item];
    [self.manager addSection:section];
    
    
    section = [RETableViewSection section];
    item = [RETableViewItem itemWithTitle:@"清理缓存"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             [item deselectRowAnimated:YES];
                         }];
    item.image = LOADIMAGE(@"qinlihuancun_icon");
    item.style = UITableViewCellStyleValue1;
    [section addItem:item];
    
    item = [RETableViewItem itemWithTitle:@"关注管理"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             [item deselectRowAnimated:YES];
                         }];
    item.image = LOADIMAGE(@"guanzhuguanli_icon");
    item.style = UITableViewCellStyleValue1;
    [section addItem:item];
    [self.manager addSection:section];
    
    
    section = [RETableViewSection section];
    item = [RETableViewItem itemWithTitle:@"设置"
                            accessoryType:UITableViewCellAccessoryDisclosureIndicator
                         selectionHandler:^(RETableViewItem *item) {
                             [item deselectRowAnimated:YES];
                         }];
    item.image = LOADIMAGE(@"shezhi_icon");
    item.style = UITableViewCellStyleValue1;
    [section addItem:item];

    [self.manager addSection:section];
    
}

@end
