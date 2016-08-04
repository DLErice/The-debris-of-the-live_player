//
//  EventViewController.h
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTableView.h"

@interface EventViewController : BASEVIEWCONTROLLER

//@property (nonatomic, copy) void (^ loadDataBlock)(ProductListRequestBlock);
@property (nonatomic, copy) void (^ selectionBlock)(EventData *);

@end
