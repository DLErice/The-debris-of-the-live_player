//
//  ArtistAttentionTableView.h
//  Plan_B
//
//  Created by DLErice on 16/6/22.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistAttentionData : NSObject
@property (nonatomic, copy) NSString *artistImageUrl;
@property (nonatomic, copy) NSString *artistName;
// 歌手的tag
//@property (nonatomic, copy) NSString *
@property (nonatomic, copy) NSString *artistAttentedNumber;
@end

@interface ArtistAttentionTableView : UITableView

@end
