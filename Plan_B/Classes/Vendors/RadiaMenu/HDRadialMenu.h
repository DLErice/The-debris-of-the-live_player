//
//  CKRadialView.h
//  HDRadialMenu
//
//  Created by DLErice on 12/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDRadialMenu;
@protocol HDRadialMenuDelegate <NSObject>

@optional

-(void)radialMenu:(HDRadialMenu *)radialMenu didSelectPopoutWithIndentifier: (NSString *) identifier;

-(BOOL)radialMenuShouldExpand:(HDRadialMenu *)radialMenu;
-(void)radialMenuDidExpand:(HDRadialMenu *)radialMenu;

-(BOOL)radialMenuShouldRetract:(HDRadialMenu *)radialMenu;
-(void)radialMenuDidRetract:(HDRadialMenu *)radialMenu;

@end

@interface HDRadialMenu : UIView

- (void) addPopoutView: (UIView *) popoutView withIndentifier: (NSString *) identifier;
- (UIView *) getPopoutViewWithIndentifier: (NSString *) identifier;
- (void) expand;
- (void) retract;

@property (nonatomic, weak) NSObject<HDRadialMenuDelegate> *delegate;

@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) NSMutableArray *popoutViews;

@property CGFloat popoutViewSize;
@property CGFloat distanceFromCenter;
@property CGFloat distanceBetweenPopouts;
@property CGFloat startAngle;
@property CGFloat animationDuration;
@property NSTimeInterval stagger;

@property BOOL menuIsExpanded;

@end


