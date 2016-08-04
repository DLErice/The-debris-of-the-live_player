//
//  BaseResponse.m
//  OneTargetGClient
//
//  Created by DLErice on 2/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "BaseResponse.h"

@interface BaseResponse ()

@property (nonatomic, strong) NSDictionary *originDictionary;

@property (nonatomic, assign) NSUInteger code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) id data;

@end

@implementation BaseResponse

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.originDictionary = dict;
    }

    return self;
}

- (void)setOriginDictionary:(NSDictionary *)originDictionary
{
//    _originDictionary = originDictionary;
//
//    id (^ objectForKey)(NSDictionary *, NSString *) = ^id (NSDictionary *dict, NSString *key) {
//        if ([[dict allKeys] containsObject:key]) {
//            return dict[key];
//        }
//
//        return nil;
//    };

//    NSNumber *code = objectForKey(originDictionary, @"code");
//    NSString *message = objectForKey(originDictionary, @"message");
//    id data = objectForKey(originDictionary, @"data");

//    _code = IsNull(code) ? 0 : [code integerValue];
//    _message = IsNull(message) ? nil : message;
//    _data = IsNull(data) ? nil : data;
}

@end
