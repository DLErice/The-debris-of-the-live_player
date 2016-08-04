//
//  ArtistPanView.h
//  Plan_B
//
//  Created by DLErice on 16/6/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowLayoutCollectionView.h"

@interface ArtistPanModel : NSObject

@property (nonatomic, copy) NSString *artistName;

@property (nonatomic, copy) NSString *attentionNumber;

//+ (instancetype)modelWithTitle:(NSString *)title image:(NSString *)imageURL;

@end

@interface ArtistPanView : FlowLayoutCollectionView



@end
