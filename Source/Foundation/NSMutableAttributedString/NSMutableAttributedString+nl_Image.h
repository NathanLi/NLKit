//
//  NSMutableAttributedString+nl_Image.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-18.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (nl_Image)

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index left:(CGFloat)left height:(CGFloat)height;
- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index height:(CGFloat)height;
- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index size:(CGSize)size;
- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index frame:(CGRect)frame;
- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index;

- (UIFont *)nl_font;

@end
