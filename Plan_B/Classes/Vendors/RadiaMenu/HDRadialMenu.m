//
//  CKRadialView.m
//  HDRadialMenu
//
//  Created by DLErice on 12/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "HDRadialMenu.h"

@interface HDRadialMenu()

@property (nonatomic, strong) NSMutableDictionary *poputIDs;
@property (nonatomic, strong) UIView *positionView;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UILabel *distanceBetweenLabel;
@property (nonatomic, strong) UILabel *angleLabel;
@property (nonatomic, strong) UILabel *staggerLabel;
@property (nonatomic, strong) UILabel *animationLabel;

@end

@implementation HDRadialMenu

#pragma mark - Initalizer

-(instancetype)init {
  self = [self initWithFrame:CGRectZero];
  return self;
}


- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.popoutViews = [NSMutableArray new];
    self.poputIDs = [NSMutableDictionary new];
    self.menuIsExpanded = false;
    self.centerView = [self makeDefaultCenterView];
      self.centerView.frame = CGRectMake(5, 5, 40, 40);//self.bounds;
    self.startAngle = -31.01;
    self.distanceBetweenPopouts = 61.27;
    self.distanceFromCenter = 100;
    self.stagger = 0.0;
    self.animationDuration = 0.4;
    [self addSubview:self.centerView];
  }
  return self;
}

#pragma mark - Setters

- (void) setCenterView:(UIView *)centerView {
  if (!centerView) {
    centerView = [self makeDefaultCenterView];
  }
  _centerView = centerView;
  UIGestureRecognizer *tap = [UITapGestureRecognizer new];
  [tap addTarget:self action:@selector(didTapCenterView:)];
  [self.centerView addGestureRecognizer:tap];
}

-(void)setFrame:(CGRect)frame{
  [super setFrame:frame];
  self.centerView.frame = self.bounds;
  
}
#pragma mark - Gesture Recognizers

- (void) didTapCenterView: (UITapGestureRecognizer *) sender {
    [self retract];
}

- (void) expand {
  if (![self.delegate respondsToSelector:@selector(radialMenuShouldExpand:)] || [self.delegate radialMenuShouldExpand:self]) {
    NSInteger i = 0;
    for (UIView *subView in self.popoutViews) {
      subView.alpha = 0;
      [UIView animateWithDuration:self.animationDuration
                            delay:self.stagger*i
           usingSpringWithDamping:0.7
            initialSpringVelocity:0.4
                          options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            subView.alpha = 1;
                            subView.transform = [self getTransformForPopupViewAtIndex:i];
                          } completion:^(BOOL finished) {
                            if ([self.delegate respondsToSelector:@selector(radialMenuDidExpand:)]) {
                              [self.delegate radialMenuDidExpand:self];
                            }
                          }];
      i++;
    }
    self.menuIsExpanded = true;
  }
}

- (void) retract {
  if (![self.delegate respondsToSelector:@selector(radialMenuShouldRetract:)] || [self.delegate radialMenuShouldRetract:self]) {
    NSInteger i = 0;
    for (UIView *subView in self.popoutViews) {
      
      [UIView animateWithDuration:self.animationDuration
                            delay:self.stagger*i
           usingSpringWithDamping:0.7
            initialSpringVelocity:0.4
                          options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            subView.transform = CGAffineTransformIdentity;
                            subView.alpha = 0;
                          } completion:^(BOOL finished) {
                            if ([self.delegate respondsToSelector:@selector(radialMenuDidRetract:)]) {
                              [self.delegate radialMenuDidRetract:self];
                            }
                          }];
      i++;
    }
    self.menuIsExpanded = false;
  }
}

- (void) didTapPopoutView: (UITapGestureRecognizer *) sender {
  UIView *view = sender.view;
  NSString * key = [self.poputIDs allKeysForObject:view][0];
  [self.delegate radialMenu:self didSelectPopoutWithIndentifier:key];
}

#pragma mark - Popout Views

- (void) addPopoutView: (UIView *) popoutView withIndentifier: (NSString *) identifier {
  if (!popoutView){
    popoutView = [self makeDefaultPopupView];
  }
  [self.popoutViews addObject:popoutView];
  [self.poputIDs setObject:popoutView forKey:identifier];
  UIGestureRecognizer *tap = [UITapGestureRecognizer new];
  [tap addTarget:self action:@selector(didTapPopoutView:)];
  [popoutView addGestureRecognizer:tap];
  popoutView.alpha = 0;
  [self addSubview:popoutView];
  [self sendSubviewToBack:popoutView];
  popoutView.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width/2,self.bounds.origin.y + self.bounds.size.height/2);
}



-(UIView *)getPopoutViewWithIndentifier:(NSString *)identifier {
  
  return [self.poputIDs objectForKey:identifier];
  
}

#pragma mark - Make Default Views

- (UIView *) makeDefaultCenterView {
  UIView *view = [UIView new];
  view.layer.cornerRadius = self.frame.size.width/2;
  return view;
}

- (UIView *) makeDefaultPopupView {
  UIView *view = [UIView new];
  view.frame = CGRectMake(0, 0, self.frame.size.width/1.5, self.frame.size.height / 1.5);
  view.layer.cornerRadius = view.frame.size.width/2;
  view.backgroundColor = [UIColor colorWithRed:0.508 green:1.000 blue:0.528 alpha:1.000];
  view.layer.shadowColor = [[UIColor blackColor] CGColor];
  view.layer.shadowOpacity = 0.6;
  view.layer.shadowRadius = 3.0;
  view.layer.shadowOffset = CGSizeMake(0, 3);
  return view;
}

#pragma mark - Helper Methods

- (CGAffineTransform) getTransformForPopupViewAtIndex: (NSInteger) index {
  CGFloat newAngle = self.startAngle + (self.distanceBetweenPopouts * index);
  CGFloat deltaY = -self.distanceFromCenter * cos(newAngle/ 180.0 * M_PI);
  CGFloat deltaX = self.distanceFromCenter * sin(newAngle/ 180.0 * M_PI);
  return CGAffineTransformMakeTranslation(deltaX, deltaY);
  
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
  if (CGRectContainsPoint(self.bounds, point)) {
    return true;
  }
  for (UIView *subView in self.popoutViews) {
    if (CGRectContainsPoint(subView.frame, point)) {
      return true;
    }
  }
  return false;
}

@end
