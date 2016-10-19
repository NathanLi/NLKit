//
//  UIAlertController+nl_Kit.m
//  forums
//
//  Created by nathan@hoomic.com on 16/8/10.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import "UIAlertController+nl_Kit.h"
#import <objc/runtime.h>

@interface UIAlertController (nl_private)

@property (nonatomic, strong) UIWindow *nl_alertWindow;

@end

@implementation UIAlertController (nl_Kit)

- (void)setNl_alertWindow:(UIWindow *)nl_alertWindow {
   objc_setAssociatedObject(self, @selector(nl_alertWindow), nl_alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)nl_alertWindow {
  return objc_getAssociatedObject(self, @selector(nl_alertWindow));
}

- (void)nl_show {
  [self nl_show:YES];
}

- (void)nl_show:(BOOL)animated {
  self.nl_alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.nl_alertWindow.rootViewController = [[UIViewController alloc] init];
  
  id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
  // Applications that does not load with UIMainStoryboardFile might not have a window property:
  if ([delegate respondsToSelector:@selector(window)]) {
    // we inherit the main window's tintColor
    self.nl_alertWindow.tintColor = delegate.window.tintColor;
  }
  
  // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
  UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
  self.nl_alertWindow.windowLevel = topWindow.windowLevel + 1;
  
  [self.nl_alertWindow makeKeyAndVisible];
  [self.nl_alertWindow.rootViewController presentViewController:self animated:animated completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
  // precaution to insure window gets destroyed
  self.nl_alertWindow.hidden = YES;
  self.nl_alertWindow = nil;
}


@end
