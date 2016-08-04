//
//  LiveViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveTableView.h"
#import "CarouselImageView.h"
#import "MixedRequest.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController {
    LiveTableView * liveTabelView = [LiveTableView new];
    
    [containerView addSubview:liveTabelView];
    [liveTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(containerView);
        make.top.equalTo(containerView.top);
        make.left.equalTo(containerView.left);
        make.right.equalTo(containerView.right);
        make.bottom.equalTo(containerView.bottom).offset(-113);
    }];
    
    
    CGFloat containerWidth = CGRectGetWidth(containerView.frame);
    
    CGFloat headerWidth = containerWidth, headerHeight = containerWidth*132/375;
    CarouselImageView *carouselView = [CarouselImageView new];
    
    ////#if DEBUG
    //    carouselView.animationEnabled = NO;
    //#else
    carouselView.animationEnabled = YES;
    //#endif
    
    [[MixedRequest request] obtainCarouselImageList:^(BOOL result, NSArray<BannerImageModel *> *arrItems) {
        
        NSArray * arritems = @[@"banner_live",@"banner_live"];
        NSMutableArray<NSString *> *urls = [[NSMutableArray alloc] initWithCapacity:arritems.count];
        
        for (NSString *item in arritems) {
            [urls addObject:item];
        }
        
        [carouselView loadImages:urls
                        maxWidth:headerWidth
                       maxHeight:headerHeight];
        
        carouselView.tapImageViewItemBlock = ^(NSInteger idx) {
            
            //-----click carouselImage function
            DDLogInfo(@"%ld",(long)idx);
            
            //            BannerImageModel *imageItem = arritems[idx];
            //
            //            if (imageItem.actionURL.length <= 0) {
            //                return;
            //            }
            
        };
    }];
    
    carouselView.bounds = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.352);
    
    liveTabelView.tableHeaderView = carouselView;
    
    //    [carouselView makeConstraints:^(MASConstraintMaker *make) {
    //        make.width.equalTo(eventTableView);
    //        make.height.equalTo(carouselView.width).multipliedBy(0.352);
    //
    //    }];
    

    
}

@end
