//
//  MixedRequest.m
//  OneTargetGClient
//
//  Created by DLErice on 4/5/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "MixedRequest.h"

@implementation MixedRequest

- (void)obtainCarouselImageList:(CarouselImageRequestBlock)completion
{
    NSString *strURL = kFuckingRequestRelativeURLPrefix "product/indexShuffling";

    [NETWORKCENTER sendRequest:strURL
                        method:HTTPMethodGet
                    parameters:nil
                    completion:^(BaseResponse *obj, NSError *error) {
        BOOL result = obj != nil;
        NSArray<BannerImageModel *> *arrItems = nil;

        if (result) {
            arrItems = [BannerImageModel arrayOfModelsFromDictionaries:obj.data];
        }

        if (completion) {
            completion(result, arrItems);
        }
    }];
}

@end
