//
//  EventTableView.h
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma marl - EventData
@interface EventData : NSObject

@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * imgUrl;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * barNam;
@property (nonatomic, strong) NSString * address;

@end



#pragma mark - EventTableView
@interface EventTableView : UITableView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<EventData *> * eventDataArray;
//@property (nonatomic, copy) OTActionWithIndexBlock selectionBlock;
@property (nonatomic, copy) void (^ selectionBlock)(EventData *);
@end
