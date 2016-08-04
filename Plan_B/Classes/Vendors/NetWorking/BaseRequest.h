//
//  BaseRequest.h
//  OneTargetGClient
//
//  Created by DLErice on 2/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkCenter.h"
#import "BaseResponse.h"
#import "BaseError.h"


#define NETWORKCENTER [NetworkCenter sharedInstance]


#pragma mark - BaseRequest

@interface BaseRequest : NSObject

/**
 *    @brief  This is lazy switcher to enable HUD indicator when sending request,
 *          according to iOS EX, you shall not use it durning some pull-to-refresh features
 *          is enabled. Wei Han.
 */
@property (nonatomic, assign) BOOL showHUDIndicator; // default is NO.

+ (instancetype)request;

@end
