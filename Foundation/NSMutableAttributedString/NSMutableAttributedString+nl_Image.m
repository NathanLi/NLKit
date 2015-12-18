//
//  NSMutableAttributedString+nl_Image.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15-3-18.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSMutableAttributedString+nl_Image.h"

@implementation NSMutableAttributedString (nl_Image)

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index {
  [self nl_insertImage:image atIndex:index size:image.size];
}

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index height:(CGFloat)height {
  [self nl_insertImage:image atIndex:index left:0 height:height];
}

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index left:(CGFloat)left height:(CGFloat)height {
  NSUInteger length = [self length];
  index = MIN(index, length);
  
  NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
  textAttachment.image = image;
  CGFloat imageWdith = image.size.width;
  CGFloat imageHeight = image.size.height;

  UIFont *font = [self nl_font];
  CGFloat textHeight = height > 0 ? height : font.ascender;
  CGFloat top = textHeight > imageHeight ? -(textHeight - imageHeight) / 2.0 : (textHeight - imageHeight) / 2.0;
  // ascender 解释 see: https://developer.apple.com/library/mac/documentation/TextFonts/Conceptual/CocoaTextArchitecture/FontHandling/FontHandling.html
  
  textAttachment.bounds = CGRectMake(left, top, imageWdith, imageHeight);
  NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
  [self insertAttributedString:textAttachmentString atIndex:index];
}

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index size:(CGSize)size {
  UIFont *font = [self nl_fontWithIndex:index];
  CGFloat sizeHeight = size.height;
  CGFloat textHeight = font.ascender;
  // ascender 解释 see: https://developer.apple.com/library/mac/documentation/TextFonts/Conceptual/CocoaTextArchitecture/FontHandling/FontHandling.html
  CGFloat top = textHeight > sizeHeight ? -(textHeight - sizeHeight) / 2.0 : (textHeight - sizeHeight) / 2.0;

  [self nl_insertImage:image atIndex:index frame:CGRectMake(0, top, size.width, size.height)];
}

- (void)nl_insertImage:(UIImage *)image atIndex:(NSUInteger)index frame:(CGRect)frame {
  NSUInteger length = [self length];
  index = MIN(index, length);
  
  NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
  textAttachment.image = image;
  textAttachment.bounds = frame;
  NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
  [self insertAttributedString:textAttachmentString atIndex:index];
}

- (UIFont *)nl_font {
  if ([self length] == 0) {
    return [UIFont systemFontOfSize:[UIFont labelFontSize]];
  }
  
  return [self attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL] ?: [UIFont systemFontOfSize:[UIFont labelFontSize]];
}

- (UIFont *)nl_fontWithIndex:(NSUInteger)index {
  NSRangePointer rangePointer = NULL;
  NSRange range;
  if ([self length] > index) {
    range = NSMakeRange(index, [self length] - index);
    rangePointer = &range;
  }
  
  index = rangePointer == NULL ? 0 : index;
  
  return [self attribute:NSFontAttributeName atIndex:index effectiveRange:rangePointer] ?: [UIFont systemFontOfSize:[UIFont labelFontSize]];
}

@end
