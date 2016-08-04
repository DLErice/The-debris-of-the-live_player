//
//  CustomTabBarController.m
//  OneTargetCommon
//
//  Created by DLErice on 12/23/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import "CustomTabBarController.h"

#import "CustomTabBar.h"

#import "ScanViewController.h"

@interface CustomTabBarController ()<UITabBarControllerDelegate , HDRadialMenuDelegate>
@property (nonatomic, strong)UIView * bottemView;
@property (nonatomic, strong)UIButton * centerButton;

@property (nonatomic, strong)HDRadialMenu *radialView;
@end

@implementation CustomTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBar.translucent = NO;
        self.delegate = self;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomTabBar * tabbar = [[CustomTabBar alloc] initWithFrame:self.tabBar.frame];
    [tabbar.centerButton addTarget:self action:@selector(addOrderView) forControlEvents:(UIControlEventTouchUpInside)];
    
    tabbar.tintColor = [UIColor colorWithRed:0.922 green:0.714 blue:0.255 alpha:1.000];
    
    tabbar.barTintColor =[UIColor colorWithWhite:0.144 alpha:1.000];
//    tabbar.radialView.delegate = self;
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)addOrderView {
    self.bottemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.bottemView.backgroundColor = [UIColor colorWithRed:0.858 green:0.971 blue:0.220 alpha:0.008];
    [self.bottemView addSubview:self.radialView];
    
    [self.view addSubview:self.bottemView];
}

- (HDRadialMenu *)radialView {
    if (!_radialView) {
        _radialView = [[HDRadialMenu alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 -25, SCREEN_HEIGHT - 60, 50, 50)];
        _radialView.delegate = self;
        UIImageView *imgView = [[UIImageView alloc] initWithImage:LOADIMAGE(@"OrangePlayer")];
        [_radialView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_radialView);
            make.size.equalTo(_radialView);
        }];
    
        _radialView.centerView.backgroundColor = [UIColor grayColor];
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor magentaColor];
        view.bounds = CGRectMake(0, 0, 50, 50);
        
        UIView *view2 = [UIView new];
        view2.backgroundColor = [UIColor magentaColor];
        view2.bounds = CGRectMake(0, 0, 50, 50);

        [_radialView addPopoutView:view2 withIndentifier:@"ONE"];
        [_radialView addPopoutView:view withIndentifier:@"TWO"];
    }
    
    [_radialView expand];
    return _radialView;
}



//
-(void)radialMenu:(HDRadialMenu *)radialMenu didSelectPopoutWithIndentifier:(NSString *)identifier{
    NSLog(@"Delegate notified of press on popout \"%@\"", identifier);
    if ([identifier isEqualToString:@"ONE"]) {
        
        ScanViewController * scanVC = [[ScanViewController alloc] init];
        [self showDetailViewController:scanVC sender:nil];
    }
    
}


- (void)radialMenuDidRetract:(HDRadialMenu *)radialMenu {
    [self.bottemView removeFromSuperview];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.radialView.menuIsExpanded == YES) {

        [self.radialView retract];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    DDLogWarn(@"View controller received some memory warnings. %@ - %s", self, __func__);
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (self.shouldSelectViewControllerBlock) {
        NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
        return self.shouldSelectViewControllerBlock(index, viewController);
    }

    return YES;
}

@end
