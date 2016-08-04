//
//  AppDelegate.m
//  Plan_B
//
//  Created by DLErice on 16/5/13.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonController.h"
#import "Macros.h"
#import "ReachabilityManager.h"
#import "MainViewController.h"
#import "AttentionViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
#import "CenterButtonViewController.h"
//#import "UserRequest.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ViewController.h"

@interface AppDelegate () <ReachabilityManagerDelegate>
@property (nonatomic, strong) CustomTabBarController *tabBarVC;

@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setupRootViewController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    ViewController * viewC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    self.window.rootViewController = viewC;
    
    viewC.PlayFinish = ^() {
        //        [viewC.view removeFromSuperview];
        self.window.rootViewController = self.tabBarVC;
    };
    
       return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.


    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    
    
  
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    


    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - ReachabilityManagerDelegate

- (void)reachabilityManager:(ReachabilityManager *)manager status:(NetworkReachabilityStatus)status
{
    NSString *strTips = nil;
    
    switch (status) {
        case NetworkReachabilityStatusUnknown:
            strTips = @"未知网络状态";
            break;
            
        case NetworkReachabilityStatusReachable:
            //strTips = @"网络正常";
            break;
            
        case NetworkReachabilityStatusNotReachable:
            strTips = @"无法连接到网络";
            break;
    }
    
    if (strTips.length > 0) {
        UIView *rootView = [[self class] topViewController].view;
        [HUDHelper showHUDInView:rootView text:strTips];
    }
}

#pragma mark - Helper

//+ (UIViewController *)recursiveTopMostViewController:(UIViewController *)viewController
//{
//    if (viewController.presentedViewController) {
//        return [[self class] recursiveTopMostViewController:viewController.presentedViewController];
//    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
//        return [[self class] recursiveTopMostViewController:[(UITabBarController *)viewController selectedViewController]];
//    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
//        return [[self class] recursiveTopMostViewController:[(UINavigationController *)viewController visibleViewController]];
//    } else {
//        return viewController;
//    }
//}
//
//+ (UIViewController *)topViewController
//{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    if (!window) {
//        window = [[UIApplication sharedApplication].windows firstObject];
//    }
//    
//    UIViewController *vc = window.rootViewController;
//    
//    return [[self class] recursiveTopMostViewController:vc];
//}

#pragma mark - Actions

- (void)initialRequest
{
    [[ReachabilityManager sharedManager] addDelegate:self];
//    
//    [[UserRequest request] getAppKey:^(NSString *key) {
//        NSAssert(key, @"invalid key!");
//        
//        SetUserDefaultObject(@"fucking_app_key", key);
//        
//        if (!key) {
//            [HUDHelper showHUDTextInWindow:@"无法与服务器建立有效连接"];
//        }
//    }];
}

#pragma mark - Private

- (void)setupRootViewController {

    MainViewController * mainVC = [MainViewController new];
    
    AttentionViewController * attentionVC = [AttentionViewController new];
    
    FindViewController *findVC = [FindViewController new];
    
    MineViewController * mineVC = [MineViewController new];
    
//    CenterButtonViewController * centerBtnVC = [CenterButtonViewController new];
    
    
    
    CustomNavigationController * customNavigationVC1 = [[CustomNavigationController alloc] initWithRootViewController:mainVC];
    CustomNavigationController * customNavigationVC2 = [[CustomNavigationController alloc] initWithRootViewController:attentionVC];
    CustomNavigationController * customNavigationVC3 = [[CustomNavigationController alloc] initWithRootViewController:findVC];
    CustomNavigationController * customNavigationVC4 = [[CustomNavigationController alloc] initWithRootViewController:mineVC];
    
    
    
    customNavigationVC1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:LOADIMAGE(@"main") selectedImage:LOADIMAGE(@"main")];
    customNavigationVC2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:LOADIMAGE(@"attention") selectedImage:LOADIMAGE(@"has_attention")];
    customNavigationVC3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:LOADIMAGE(@"find") selectedImage:LOADIMAGE(@"has_find")];
    customNavigationVC4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:LOADIMAGE(@"mine") selectedImage:LOADIMAGE(@"has_mine")];
    
    self.tabBarVC = [CustomTabBarController new];
    
    self.tabBarVC.viewControllers = @[customNavigationVC1,customNavigationVC2,customNavigationVC3,customNavigationVC4];

    
        self.window.rootViewController = self.tabBarVC;
    
}



@end
