//
//  BaseResponse.h
//  OneTargetGClient
//
//  Created by DLErice on 2/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kStatusCodeSuccess 200


@interface BaseResponse : NSObject

@property (nonatomic, strong, readonly) NSDictionary *originDictionary;

@property (nonatomic, assign, readonly) NSUInteger code;
@property (nonatomic, copy, readonly) NSString *message;
@property (nonatomic, strong, readonly) id data;

- (instancetype)initWithDictionary:(NSDictionary *)dict NS_DESIGNATED_INITIALIZER;

@end
