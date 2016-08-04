//
//  CarouselImageView.m
//  OneTargetGClient
//
//  Created by DLErice on 12/30/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import "CarouselImageView.h"

#define kSTRKey_CurrentPage @"currentPage"


@interface CarouselImageView ()
{
    BOOL animated; // self-managed for internal
}

@property (nonatomic, strong) NSArray<NSString *> *imageURLs;

@property (nonatomic, assign) CGFloat maxHeight;
@property (nonatomic, assign) CGFloat maxWidth;

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) NSTimer *animationTimer;

@end

@implementation CarouselImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _pageControl = [UIPageControl new];
        _pageControl.hidesForSinglePage = YES;
        [_pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@10);
            make.width.equalTo(self.width);
            make.bottom.equalTo(self.bottom).offset(-5);
        }];

        [_pageControl addObserver:self forKeyPath:kSTRKey_CurrentPage options:NSKeyValueObservingOptionNew context:nil];

        _scrollView = [UIScrollView new];
        _scrollView.alwaysBounceHorizontal = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

        UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureTrigger:)];
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        [_scrollView addGestureRecognizer:swipeLeftGesture];
        UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureTrigger:)];
        swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [_scrollView addGestureRecognizer:swipeRightGesture];

        _containerView = [UIView new];
        [_scrollView addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView);
            make.height.equalTo(_scrollView.height).priorityHigh();
        }];
    }

    return self;
}

- (void)removeFromSuperview
{
    [super removeFromSuperview];
    // DDLogDebug(@"%s", __func__);

    if (animated) {
        self.animationEnabled = NO;
    }
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    // DDLogDebug(@"%s, new window: %@", __func__, newWindow ? @"YES" : @"NO");
//
    if (animated) {
        self.animationEnabled = newWindow != nil;
    }
}

- (void)dealloc
{
    [_pageControl removeObserver:self forKeyPath:kSTRKey_CurrentPage];

    if (animated) {
        self.animationEnabled = NO;
    }
}

#pragma mark - Private

- (void)swipeGestureTrigger:(id)sender
{
    UISwipeGestureRecognizer *swipeGesture = (__kindof UISwipeGestureRecognizer *)sender;

    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft &&
        _pageControl.currentPage < _pageControl.numberOfPages - 1) {
        _pageControl.currentPage++;
    } else if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight &&
               _pageControl.currentPage > 0) {
        _pageControl.currentPage--;
    }
}

- (void)changePage
{
    CGFloat x = _pageControl.currentPage * _scrollView.frame.size.width;

    [_scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)imageViewItemTapped:(id)sender
{
    UITapGestureRecognizer *tapGesture = (__kindof UITapGestureRecognizer *)sender;
    UIImageView *imageView = (UIImageView *)tapGesture.view;

    if (self.tapImageViewItemBlock) {
        self.tapImageViewItemBlock(imageView.tag);
    }
}

- (void)startAnimation
{
    NSInteger nextPage = _pageControl.currentPage + 1;

    _pageControl.currentPage = nextPage % _pageControl.numberOfPages;
}

#pragma mark - Property

- (void)setAnimationEnabled:(BOOL)animationEnabled
{
    _animationEnabled = animationEnabled;
    animated = animationEnabled;

    if (animationEnabled) {
        if (_animationTimer && _animationTimer.isValid) {
            [_animationTimer invalidate];
        }

        _animationTimer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    } else {
        [_animationTimer invalidate];
    }
}

#pragma mark - NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context
{
    if ([object isEqual:_pageControl] && [keyPath isEqualToString:kSTRKey_CurrentPage]) {
        [self changePage];
    }
}

#pragma mark - Public

- (void)loadImages:(nonnull NSArray<NSString *> *)imageURLs maxWidth:(CGFloat)width maxHeight:(CGFloat)height
{
    _imageURLs = imageURLs;
    _maxHeight = height;
    _maxWidth = width;

    [_containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    _pageControl.numberOfPages = imageURLs.count;
    _pageControl.currentPage = 0;

    UIImageView *leftImageView = nil;

    for (NSInteger idx = 0; idx < imageURLs.count; idx++) {
        NSString *itemURL = imageURLs[idx];

        UIImageView *imageView = [UIImageView new];
#if DEMOUI
        if (![itemURL hasPrefix:@"http"]) {
            imageView.image = LOADIMAGE(itemURL);
        } else {
            [imageView sd_setImageWithURL:[NSURL URLWithString:itemURL]];
        }
#else
        [imageView sd_setImageWithURL:[NSURL URLWithString:itemURL]];
#endif
        imageView.tag = idx;
        imageView.userInteractionEnabled = YES;

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewItemTapped:)];
        [imageView addGestureRecognizer:tapGesture];

        [_containerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(_maxHeight));
            make.width.equalTo(@(_maxWidth));
            make.top.equalTo(_containerView.top);

            if (leftImageView) {
                make.left.equalTo(leftImageView.right);
            } else {
                make.left.equalTo(_containerView.left);
            }
        }];

        leftImageView = imageView;
    }

    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(leftImageView.right).offset(2);
    }];

    [self bringSubviewToFront:_pageControl];
}

@end
