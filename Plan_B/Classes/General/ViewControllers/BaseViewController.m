//
//  BaseViewController.m
//  OneTargetCClient
//
//  Created by DLErice on 12/3/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import "BaseViewController.h"
#import "AlertHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor blackColor];

    if (self.navigationController.viewControllers.count > 1) {
        UIImageView *imageBackButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 9, 18)];
//        imageBackButton.image = LOADIMAGE(@"back_button");
        imageBackButton.userInteractionEnabled = YES;
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:imageBackButton];

        self.navigationItem.leftBarButtonItem = backBarButton;

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popCurrentViewController)];
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressBackBarButton:)];

        [imageBackButton addGestureRecognizer:tapGesture];
        [imageBackButton addGestureRecognizer:longPressGesture];
    }

    
    if ([self conformsToProtocol:@protocol(BuildViewDelegate)]) {
        id<BuildViewDelegate> controller = (id<BuildViewDelegate>)self;

        if ([controller respondsToSelector:@selector(buildSubview:controller:)]) {
            [controller buildSubview:self.view controller:self];
        } else {
         
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (self.willAppearBlock) {
        self.willAppearBlock(animated);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (self.didAppearBlock) {
        self.didAppearBlock(animated);
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    if (self.willDisappearBlock) {
        self.willDisappearBlock(animated);
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    if (self.didDisappearBlock) {
        self.didDisappearBlock(animated);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Public

- (void)pushViewController:(UIViewController *)viewController
{
    NSAssert(self.navigationController, @"No navigation controller in current view controller stack!");

    [self.navigationController pushViewController:viewController animated:YES];
}

- (UIViewController *)popCurrentViewController
{
    return [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Private

- (void)longPressBackBarButton:(id)sender
{
    UILongPressGestureRecognizer *longPressGesture = sender;

    if (longPressGesture.state == UIGestureRecognizerStateBegan) {
        AlertHelper *alert = [AlertHelper alertControllerWithTitle:@"确定要直接回到首页吗?" message:@"" preferredStyle:UIAlertControllerStyleAlert];

        [alert addAction:@"确定"
                   style:UIAlertActionStyleDefault
                 handler:^(UIAlertAction *action) {
            [self.navigationController
             popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:@"取消" style:UIAlertActionStyleCancel handler:nil];

        [alert presentInViewController:self];
    }
}

@end
