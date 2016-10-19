//
//  UIButton+Color.m
//  qinyouquanOphone
//
//  Created by Nathan Li on 14-5-22.
//  Copyright (c) 2014年 Hoomic. All rights reserved.
//

#import "UIButton+Color.h"
#import "UIImage+Color.h"

@implementation UIButton (Color)

- (void)convertBackgroundColorToBackgroundImage {
  [self convertBackgroundColorToBackgroundImageForState:UIControlStateNormal];
  self.backgroundColor = [UIColor clearColor];
}

- (void)convertBackgroundColorToBackgroundImageForState:(UIControlState)state {
  [self setBackgroundImageWithColor:self.backgroundColor forState:state];
  self.backgroundColor = [UIColor clearColor];
}

- (void)convertBackgroundColorToImage {
  [self convertBackgroundColorToImageForState:UIControlStateNormal];
  self.backgroundColor = [UIColor clearColor];
}

- (void)convertBackgroundColorToImageForState:(UIControlState)state {
  [self setImageWithColor:self.backgroundColor forState:state];
  self.backgroundColor = [UIColor clearColor];
}

- (UIImage *)setBackgroundImageWithColor:(UIColor *)color forState:(UIControlState)state {
  UIImage *image = [UIImage imageWithColor:color];
  [self setBackgroundImage:image forState:state];
  
  return image;
}

- (UIImage *)setImageWithColor:(UIColor *)color forState:(UIControlState)state {
  UIImage *image = [UIImage imageWithColor:color];
  [self setImage:image forState:state];
  
  return image;
}

@end
