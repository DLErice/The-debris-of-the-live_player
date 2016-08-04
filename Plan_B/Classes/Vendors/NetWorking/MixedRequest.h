//
//  MixedRequest.h
//  OneTargetGClient
//
//  Created by DLErice on 4/5/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "BaseRequest.h"
//#import "JMCarouselImage.h"
#import "BannerImageModel.h"

typedef void (^CarouselImageRequestBlock)(BOOL, NSArray<BannerImageModel *> *);


@interface MixedRequest : BaseRequest

- (void)obtainCarouselImageList:(CarouselImageRequestBlock)completion;

@end
