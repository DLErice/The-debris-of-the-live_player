//
//  NSString+ValueValidation.h
//  OneTargetCommon
//
//  Created by DLErice on 1/19/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ValueValidation)

- (BOOL)isNullOrEmpty;
- (NSString *)trimEmptySpace;
@end
