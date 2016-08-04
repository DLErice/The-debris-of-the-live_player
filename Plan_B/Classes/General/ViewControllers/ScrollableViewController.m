//
//  ScrollableViewController.m
//  OneTargetCommon
//
//  Created by DLErice on 1/28/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "ScrollableViewController.h"

@interface ScrollableViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollableViewController

//- (void)loadView
//{
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.delegate = self;
//    self.view = scrollView;
//
//    _containerView = [UIView new];
//
//    [scrollView addSubview:_containerView];
//    [_containerView mas_makeConstraints:^(MASConstraintMaker *make){
//        make.width.equalTo(scrollView.width);
//        make.edges.equalTo(scrollView);
//        //make.height.equalTo(scrollView.height).priorityHigh();
//    }];
//}

- (void)loadView
{
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    UIView * view = [UIView new];
    self.view = view;
    [view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    _containerView = [UIView new];
    [self.scrollView addSubview:_containerView];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(self.scrollView.width);
        make.edges.equalTo(self.scrollView);
        //make.height.equalTo(scrollView.height).priorityHigh();
    }];  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if ([self conformsToProtocol:@protocol(ScrollableViewControllerDelegate)]) {
        id<ScrollableViewControllerDelegate> controller = (id<ScrollableViewControllerDelegate>)self;
        
        if ([controller respondsToSelector:@selector(buildScrollViewSubview:controller:)]) {
            [controller buildScrollViewSubview:self.scrollView controller:self];
        } else {
            
        }
    }


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark -

//
- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];

    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];

    if (self.keyboardChangedBlock) {
        self.keyboardChangedBlock(keyboardFrameBegin, keyboardFrameEnd);
    }

    [UIView commitAnimations];
}

#pragma mark - Public

- (void)setLastBottomView:(UIView *)lastBottomView
{
    _lastBottomView = lastBottomView;
    NSParameterAssert(lastBottomView);

    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastBottomView.bottom).offset(16);
    }];
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollContentSetBlock) {
        self.scrollContentSetBlock(scrollView.contentOffset);
    }

}


@end
