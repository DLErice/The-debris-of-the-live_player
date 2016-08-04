//
//  SceneTableView.h
//  Plan_B
//
//  Created by DLErice on 16/6/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SceneData : NSObject
@property (nonatomic, copy) NSString *sceneBarName;
@property (nonatomic, copy) NSString *sceneBarAddress;
@property (nonatomic, copy) NSString *sceneBgImageUrl;
@property (nonatomic, copy) NSString *sceneBarPhoneNumber;
@property (nonatomic, copy) NSString *sceneBarID;

@end

#pragma mark - SceneTableView
@interface SceneTableView : UITableView
@property (nonatomic, strong) NSArray<SceneData*> * sceneList;
@property (nonatomic, copy) void(^selectionBlock)(SceneData*);
@end
