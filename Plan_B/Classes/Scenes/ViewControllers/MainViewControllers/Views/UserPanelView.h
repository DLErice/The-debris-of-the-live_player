//
//  UserPanelView.h
//  OneTargetGClient
//
//  Created by DLErice on 1/4/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "FlowLayoutCollectionView.h"

typedef NSDictionary<NSString */*title*/, NSString */*image*/> *UserPanelDataType;

@interface UserPanelView : FlowLayoutCollectionView

@property (nonatomic, strong) NSArray<UserPanelDataType> *dataItems;

@end
