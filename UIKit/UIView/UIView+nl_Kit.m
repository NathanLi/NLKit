//
//  UIView+NLLayer.m
//  jobsradar
//
//  Created by Nathan Li on 14-8-18.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIView+nl_Kit.h"
#import <objc/runtime.h>

@implementation UIView (NLLayer)

- (void)setRound:(CGFloat)round {
  self.layer.cornerRadius = round;
  self.layer.masksToBounds = YES;
}

- (CGFloat)round {
  return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
  self.layer.borderWidth = borderWidth;
  self.layer.masksToBounds = YES;
}

- (CGFloat)borderWidth {
  return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
  self.layer.borderColor = borderColor.CGColor;
  self.layer.masksToBounds = YES;
}

- (UIColor *)borderColor {
  return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWith:(CGFloat)width color:(UIColor *)color {
  self.layer.borderColor = color.CGColor;
  self.layer.borderWidth = width;
  self.layer.masksToBounds = YES;
}

- (void)setNl_shadowColor:(UIColor *)nl_shadowColor {
  self.layer.shadowColor = nl_shadowColor.CGColor;
}

- (UIColor *)nl_shadowColor {
  return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setNl_shadowOffset:(CGSize)nl_shadowOffset {
  self.layer.shadowOffset = nl_shadowOffset;
}

- (CGSize)nl_shadowOffset {
  return self.layer.shadowOffset;
}

- (void)setNl_shadowRadius:(CGFloat)nl_shadowRadius {
  self.layer.shadowRadius = nl_shadowRadius;
}

- (CGFloat)nl_shadowRadius {
  return self.layer.shadowRadius;
}

- (void)setNl_shadowOpacity:(CGFloat)nl_shadowOpacity {
  self.layer.shadowOpacity = nl_shadowOpacity;
}

- (CGFloat)nl_shadowOpacity {
  return self.layer.shadowOpacity;
}

- (void)nl_setBorderWith:(CGFloat)width color:(UIColor *)color top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right {
  if (top) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.nl_width, width)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    if (self.translatesAutoresizingMaskIntoConstraints == NO) {
      subView.translatesAutoresizingMaskIntoConstraints = NO;
      NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
      NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView(height)]" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
      [self addConstraints:constraintH];
      [self addConstraints:constraintV];
    }
    
  }
  
  if (left) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.nl_height)];
    subView.backgroundColor = color;
    
    [self addSubview:subView];
    
    if (self.translatesAutoresizingMaskIntoConstraints == NO) {
      subView.translatesAutoresizingMaskIntoConstraints = NO;
      NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView(width)]" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
      NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
      [self addConstraints:constraintH];
      [self addConstraints:constraintV];
    }
  }
  
  
  if (bottom) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, self.nl_height - width, self.nl_width, width)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    if (self.translatesAutoresizingMaskIntoConstraints == NO) {
      subView.translatesAutoresizingMaskIntoConstraints = NO;
      NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
      NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subView(height)]|" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
      [self addConstraints:constraintH];
      [self addConstraints:constraintV];
    }
  }
  
  
  if (right) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(self.nl_width - width, 0, width, self.nl_height)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    if (self.translatesAutoresizingMaskIntoConstraints == NO) {
      subView.translatesAutoresizingMaskIntoConstraints = NO;
      NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[subView(width)]|" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
      NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
      [self addConstraints:constraintH];
      [self addConstraints:constraintV];
    }
  }
}

- (void)nl_setTopBorderWith:(CGFloat)width color:(UIColor *)color {[self nl_setBorderWith:width color:color top:YES left:NO bottom:NO right:NO];}
- (void)nl_setLeftBorderWith:(CGFloat)width color:(UIColor *)color {[self nl_setBorderWith:width color:color top:NO left:YES bottom:NO right:NO];}
- (void)nl_setBottomBorderWith:(CGFloat)width color:(UIColor *)color {[self nl_setBorderWith:width color:color top:NO left:NO bottom:YES right:NO];}
- (void)nl_setRightBorderWith:(CGFloat)width color:(UIColor *)color {[self nl_setBorderWith:width color:color top:NO left:NO bottom:NO right:YES];}

@end

@implementation UIView (NL_Frame)

-(CGFloat)nl_x         {   return CGRectGetMinX(self.frame);   }
-(CGFloat)nl_y         {   return CGRectGetMinY(self.frame);   }
-(CGFloat)nl_width     {   return CGRectGetWidth(self.frame);  }
-(CGFloat)nl_height    {   return CGRectGetHeight(self.frame); }
-(CGPoint)nl_origin    {   return self.frame.origin;           }
-(CGSize)nl_size       {   return self.frame.size;             }
-(CGFloat)nl_left      {   return CGRectGetMinX(self.frame);   }
-(CGFloat)nl_right     {   return CGRectGetMaxX(self.frame);   }
-(CGFloat)nl_top       {   return CGRectGetMinY(self.frame);   }
-(CGFloat)nl_bottom    {   return CGRectGetMaxY(self.frame);   }
-(CGFloat)nl_centerX   {   return self.center.x;               }
-(CGFloat)nl_centerY   {   return self.center.y;               }
-(CGPoint)nl_boundsCenter  {   return CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));   };

-(void)setNl_x:(CGFloat)nl_x
{
  CGRect frame = self.frame;
  frame.origin.x = nl_x;
  self.frame = frame;
}

-(void)setNl_y:(CGFloat)nl_y
{
  CGRect frame = self.frame;
  frame.origin.y = nl_y;
  self.frame = frame;
}

-(void)setNl_width:(CGFloat)nl_width
{
  CGRect frame = self.frame;
  frame.size.width = nl_width;
  self.frame = frame;
}

-(void)setNl_height:(CGFloat)nl_height
{
  CGRect frame = self.frame;
  frame.size.height = nl_height;
  self.frame = frame;
}

-(void)setNl_origin:(CGPoint)nl_origin
{
  CGRect frame = self.frame;
  frame.origin = nl_origin;
  self.frame = frame;
}

-(void)setNl_size:(CGSize)nl_size
{
  CGRect frame = self.frame;
  frame.size = nl_size;
  self.frame = frame;
}

-(void)setNl_left:(CGFloat)nl_left
{
  CGRect frame = self.frame;
  frame.origin.x = nl_left;
  self.frame = frame;
}

-(void)setNl_right:(CGFloat)nl_right
{
  CGRect frame = self.frame;
  frame.size.width = MAX(nl_right-self.nl_left, 0);
  self.frame = frame;
}

-(void)setNl_top:(CGFloat)nl_top
{
  CGRect frame = self.frame;
  frame.origin.y = nl_top;
  self.frame = frame;
}

-(void)setNl_bottom:(CGFloat)nl_bottom
{
  CGRect frame = self.frame;
  frame.size.height = MAX(nl_bottom-self.nl_top, 0);
  self.frame = frame;
}

-(void)setNl_centerX:(CGFloat)nl_centerX
{
  CGPoint center = self.center;
  center.x = nl_centerX;
  self.center = center;
}

-(void)setNl_centerY:(CGFloat)nl_centerY
{
  CGPoint center = self.center;
  center.y = nl_centerY;
  self.center = center;
}


@end


@implementation UIView (nl_Kit)



+ (void)load {
  Method pointInsideMethod = class_getInstanceMethod(self, @selector(pointInside:withEvent:));
  Method nl_pointInsideMethod = class_getInstanceMethod(self, @selector(nl_pointInside:withEvent:));
  
  if (pointInsideMethod && nl_pointInsideMethod) {
    method_exchangeImplementations(pointInsideMethod, nl_pointInsideMethod);
  }
}

- (BOOL)nl_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
  if (self.nl_pointInsideBlock) {
    return self.nl_pointInsideBlock(point, event);
  }
  
  return [self nl_pointInside:point withEvent:event];
}

static void *nl_pointInsideBlockKey = &nl_pointInsideBlockKey;
- (void)setNl_pointInsideBlock:(BOOL (^)(CGPoint, UIEvent *))nl_pointInsideBlock {
  objc_setAssociatedObject(self, nl_pointInsideBlockKey, nl_pointInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL (^)(CGPoint, UIEvent *))nl_pointInsideBlock {
  return objc_getAssociatedObject(self, nl_pointInsideBlockKey);
}

- (UIView *)nl_firstResponder {
  if ([self isFirstResponder]) return self;
  
  for (UIView *subView in [self subviews]) {
    UIView *firstResponder = [subView nl_firstResponder];
    if (firstResponder) return firstResponder;
  }
  
  return nil;
}

@end

@implementation UIView (nl_Image)

- (UIImage *)nl_screenshot {
  UIGraphicsBeginImageContext(self.bounds.size);
  [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

@end
