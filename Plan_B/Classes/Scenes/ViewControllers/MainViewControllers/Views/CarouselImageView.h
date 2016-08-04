//
//  CarouselImageView.h
//  OneTargetGClient
//
//  Created by DLErice on 12/30/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface CarouselImageView : UIView

@property (nonatomic, readonly, nonnull)  NSArray<NSString *> *imageURLs;
@property (nonatomic, copy, nullable) void (^ tapImageViewItemBlock)(NSInteger index);

@property (nonatomic, assign) BOOL animationEnabled; // default is NO

- (void)loadImages:(nonnull NSArray<NSString *> *)imageURLs maxWidth:(CGFloat)width maxHeight:(CGFloat)height;

@end
