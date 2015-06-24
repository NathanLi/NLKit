//
//  UIImage+nl_Kit.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-4-3.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIImage+nl_Kit.h"
#import "CGRect+Additions.h"

@implementation UIImage (nl_Kit)

- (UIImage *)nl_drawText:(NSString *)text inRect:(CGRect)rect {
  return [self nl_drawText:text font:[UIFont systemFontOfSize:[UIFont systemFontSize]] inRect:rect];
}

- (UIImage *)nl_drawText:(NSString *)text font:(UIFont *)font inRect:(CGRect)rect {
  UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
  [self drawInRect:CGRectMake(0,0, self.size.width,self.size.height)];
  [[UIColor whiteColor] set];
  
  NSDictionary *att = @{NSFontAttributeName:font,
                        NSForegroundColorAttributeName: [UIColor whiteColor]};
  CGSize size = [text sizeWithAttributes:att];
  rect = CGRectMakeWithCenterAndSize(CGRectCenter(rect), size);
  [text drawInRect:rect withAttributes:att];
  
  
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

- (UIImage *)nl_resizableImageCenter {
  CGFloat top = self.size.height / 2;
  CGFloat left = self.size.width / 2;
  UIImage *newImage = [self resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top - 1, left - 1)];
  return newImage;
}

- (NSData *)nl_dataWithCompressionQuality:(CGFloat)quality {
  NSData *data = UIImageJPEGRepresentation(self, 0.5);
  if (data == nil) {
    data = UIImagePNGRepresentation(self);
  }
  return data;
}

- (NSData *)nl_data {
  return [self nl_dataWithCompressionQuality:.5];
}

@end
