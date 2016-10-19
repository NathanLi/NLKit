//
//  UIView+NLLayer.m
//  jobsradar
//
//  Created by Nathan Li on 14-8-18.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIView+nl_Kit.h"
#import "NSObject+nl_Kit.h"
#import "NSObject+nl_associatedObject.h"
#import <objc/runtime.h>

@implementation UIView (NLLayer)

- (void)setNl_cornerRadius:(CGFloat)nl_cornerRadius {
  self.layer.cornerRadius = nl_cornerRadius;
  self.layer.masksToBounds = YES;
}

- (CGFloat)nl_cornerRadius {
  return self.layer.cornerRadius;
}

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
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView(height)]" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
    
  }
  
  if (left) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.nl_height)];
    subView.backgroundColor = color;
    
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView(width)]" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
  }
  
  
  if (bottom) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, self.nl_height - width, self.nl_width, width)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subView(height)]|" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
  }
  
  
  if (right) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(self.nl_width - width, 0, width, self.nl_height)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[subView(width)]|" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
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
  frame.origin.x = nl_right - frame.size.width;
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
  frame.origin.y = nl_bottom - frame.size.height;
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
  
  Method hitTestMethod = class_getInstanceMethod(self, @selector(hitTest:withEvent:));
  Method nl_hitTestMethod = class_getInstanceMethod(self, @selector(nl_hitTest:withEvent:));
  if (hitTestMethod && nl_hitTestMethod) {
    method_exchangeImplementations(hitTestMethod, nl_hitTestMethod);
  }
  
  
  Method desciptionMethod = class_getInstanceMethod(self, @selector(description));
  Method nl_desciptionMethod = class_getInstanceMethod(self, @selector(nl_description));
  if (desciptionMethod && nl_desciptionMethod) {
    method_exchangeImplementations(desciptionMethod, nl_desciptionMethod);
  }
}

- (BOOL)nl_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
  if (self.nl_pointInsideBlock) {
    return self.nl_pointInsideBlock(point, event);
  }
  
  return [self nl_pointInside:point withEvent:event];
}

- (UIView *)nl_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
  if (self.nl_hitTestBlock && !self.hidden) {
    return self.nl_hitTestBlock(point, event);
  }
  return [self nl_hitTest:point withEvent:event];
}

- (void)setNl_hitTestBlock:(UIView *(^)(CGPoint, UIEvent *))nl_hitTestBlock {
  objc_setAssociatedObject(self, @selector(nl_hitTestBlock), nl_hitTestBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *(^)(CGPoint, UIEvent *))nl_hitTestBlock {
  return objc_getAssociatedObject(self, @selector(nl_hitTestBlock));
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



- (NSString *)nl_description {
  id key = [self nl_key];
  NSString *description = nil;
  if (key) {
    description = [NSMutableString stringWithFormat:@"(%@)%@", key, [self nl_description]];
  } else {
    description = [self nl_description];
  }
  
  return description;
}

- (void)setNl_key:(id)nl_key {
  objc_setAssociatedObject(self, @selector(nl_key), nl_key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)nl_key {
  return objc_getAssociatedObject(self, _cmd);
}

+ (instancetype)nl_viewWithBuildBlock:(void (^)(__kindof UIView *))buildBlock {
  UIView *view = [[self alloc] initWithFrame:CGRectZero];
  if (buildBlock) {
    buildBlock(view);
  }
  return view;
}

@end

@implementation UIView (nl_Image)

- (UIImage *)nl_screenshot {
  UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, .0);
  if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
  }
  
  return nil;
}

@end



@implementation UIView (nl_DEBUG)

- (void)_nl_setNeedsLayout_MainThreadCheck {
  if (![NSThread isMainThread]) {
    [self _nl_methodCalledNotFromMainThread:NSStringFromSelector(_cmd)];
  }
  
  [self _nl_setNeedsLayout_MainThreadCheck];
}

- (void)_nl_setNeedsDisplay_MainThreadCheck {
  if (![NSThread isMainThread]) {
    [self _nl_methodCalledNotFromMainThread:NSStringFromSelector(_cmd)];
  }
  
  [self _nl_setNeedsDisplay_MainThreadCheck];
}

- (void)_nl_setNeedsDisplayInRect_MainThreadCheck:(CGRect)rect {
  if (![NSThread isMainThread]) {
    [self _nl_methodCalledNotFromMainThread:NSStringFromSelector(_cmd)];
  }
  
  [self _nl_setNeedsDisplayInRect_MainThreadCheck:rect];
}

- (void)_nl_methodCalledNotFromMainThread:(NSString *)methodName {
  NSLog(@"-[%@ %@] being called on background queue. Break on %s to find out where", NSStringFromClass([self class]), methodName, __PRETTY_FUNCTION__);
}

+ (void)nl_toggleViewMainThreadChecking {
  [UIView nl_swizzleMethod:@selector(setNeedsLayout) withMethod:@selector(_nl_setNeedsLayout_MainThreadCheck)];
  [UIView nl_swizzleMethod:@selector(setNeedsDisplay) withMethod:@selector(_nl_setNeedsDisplay_MainThreadCheck)];
  [UIView nl_swizzleMethod:@selector(setNeedsDisplayInRect:) withMethod:@selector(_nl_setNeedsDisplayInRect_MainThreadCheck:)];
}

@end
