//
//  EventViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "EventViewController.h"
#import "CarouselImageView.h"
#import "MixedRequest.h"
#import "OTRefresh.h"
#import "EventDetailViewController.h"
//#import "MixedRequest.h"
//#import "UserPanelView.h"

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor =[ UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - BuildViewDelegate

- (void)buildSubview:(UIView *)containerView controller:(BaseViewController *)viewController
{
    EventTableView * eventTableView = [EventTableView new];
    
    @weakify(self);
    
    eventTableView.selectionBlock = ^(EventData * data){
        @strongify(self);
        EventDetailViewController * eventDetailVC = [EventDetailViewController new];
        
        [self showViewController:eventDetailVC sender:nil];
    
    };
 
//    @weakify(self);
//    @weakify(eventTableView);
    
//    evebtTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [containerView addSubview:eventTableView];
//    
    [eventTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
        
        NSArray * arritems = @[@"banner",@"banner"];
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

    eventTableView.tableHeaderView = carouselView;

//    [carouselView makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(eventTableView);
//        make.height.equalTo(carouselView.width).multipliedBy(0.352);
//
//    }];

    
  
    
    

    eventTableView.refreshHeader = [OTRefresh headerWithRefreshingBlock:^{
//        @strongify(self);
//        @strongify(eventTableView);
        
        sleep(2.0);
    
            [eventTableView.refreshHeader endRefreshing];

        
    }];

    


}


@end
