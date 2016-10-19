//
//  UILabel+UILabelPasteboard.m
//  QinXin
//
//  Created by Nathan Li on 13-9-11.
//  Copyright (c) 2013年 com.hoomic. All rights reserved.
//

#import "UILabel+nl_Copy.h"
#import <objc/runtime.h>

@implementation UILabel (nl_Copy)

static void *keyMethodCopyEnabled =&keyMethodCopyEnabled;
- (void)setCopyEnabled:(BOOL)copyEnabled {
  objc_setAssociatedObject(self, keyMethodCopyEnabled, @(copyEnabled), OBJC_ASSOCIATION_COPY);
  
  if (copyEnabled) {
    [self nl_openCopy];
  } else {
    [self nl_closeCopy];
  }
}

- (BOOL)copyEnabled {
  return [objc_getAssociatedObject(self, keyMethodCopyEnabled) boolValue];
}

#pragma mark - 复制功能
- (void)nl_openCopy {
  self.userInteractionEnabled = YES;
  
  [[self longPressGestureRecoginzer] addTarget:self action:@selector(nl_longPressCopy)];
}

- (void)nl_closeCopy {
  [[self longPressGestureRecoginzer] removeTarget:self action:@selector(nl_longPressCopy)];
}

- (void)nl_longPressCopy {
  UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(nl_copy:)];
  UIMenuController *menuController = [UIMenuController sharedMenuController];
  [menuController setMenuItems:@[copyItem]];
  [menuController setTargetRect:self.bounds inView:self];
  [self becomeFirstResponder];
  [menuController setMenuVisible:YES animated:YES];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
  return (action == @selector(nl_copy:));
}

- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (BOOL)canResignFirstResponder {
  return YES;
}

- (void)nl_copy:(id)obj {
  UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
  pasteboard.string = self.text;
  
  [self resignFirstResponder];
}


- (UILongPressGestureRecognizer *)longPressGestureRecoginzer {
  NSArray *gestures = [self gestureRecognizers];

  for (UIGestureRecognizer *gesture in gestures) {
    if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
      return (UILongPressGestureRecognizer *)gesture;
    }
  }
  
  UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] init];
  [self addGestureRecognizer:longPressGesture];
  return longPressGesture;
}



@end
