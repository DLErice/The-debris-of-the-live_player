//
//  CustomTabBar.m
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar () 
@end

@implementation CustomTabBar

-(UIButton *)centerButton {
    if (!_centerButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setImage:LOADIMAGE(@"OrangePlayer") forState:UIControlStateNormal];
        [btn setBackgroundImage:LOADIMAGE(@"OrangePlayer") forState:UIControlStateNormal];
        
//        [btn setImage:LOADIMAGE(@"OrangePlayer") forState:UIControlStateHighlighted];
//        [btn setBackgroundImage:LOADIMAGE(@"OrangePlayer") forState:UIControlStateHighlighted];
        
        _centerButton = btn;
        
        //是按钮的尺寸默认跟背景图片一样大
        
//        [btn sizeToFit];
        btn.bounds = CGRectMake(0, 0, 50, 50);
        [self addSubview:_centerButton];
    }
    return _centerButton;

}

//- (HDRadialMenu *)radialView {
//    if (!_radialView) {
//        _radialView = [[HDRadialMenu alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//        _radialView.delegate = self;
//        _radialView.centerView.backgroundColor = [UIColor grayColor];
//        UIView *view = [UIView new];
//        view.backgroundColor = [UIColor blackColor];
//        view.bounds = CGRectMake(0, 0, 50, 50);
//        
//        UIView *view2 = [UIView new];
//        view2.backgroundColor = [UIColor blackColor];
//        view2.bounds = CGRectMake(0, 0, 50, 50);
//        
//        
//        
//        [_radialView addPopoutView:nil withIndentifier:@"ONE"];
//        [_radialView addPopoutView:nil withIndentifier:@"TWO"];
//        
////        _radialView = _radialView;
//        
//        [self addSubview:_radialView];
//    }
//
//
//    return _radialView;
//}

-(void)layoutSubviews {
    [super layoutSubviews];

    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;

    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / 5;
    CGFloat btnH = h;
    
    int i = 0;
    for (UIView *tabBarBtn in self.subviews) {

        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            btnX = i * btnW;
            
            tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);

            if (i==1) {
                i++;
            }
            i++;
        }
    }
    self.centerButton.center = CGPointMake(w * 0.5, h * 0.5 - 10);
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *ima = (UIImageView *)view;
            ima.hidden = YES;
        }
    }
}




@end
