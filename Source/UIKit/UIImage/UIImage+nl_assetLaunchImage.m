//
//  UIImage+nl_launchImage.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/8/13.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "UIImage+nl_assetLaunchImage.h"

@implementation UIImage (nl_assetLaunchImage)

+ (UIImage *)nl_assetLaunchImage {
  NSString *name = [self nl_assetLaunchImageName];
  UIImage *launchImage = [UIImage imageNamed:name];
  return launchImage;
}

+ (NSString *)nl_assetLaunchImageName {
  NSDictionary *dict = @{@"320x480" : @"LaunchImage-700",
                         @"320x568" : @"LaunchImage-700-568h",
                         @"375x667" : @"LaunchImage-800-667h",
                         @"414x736" : @"LaunchImage-800-Portrait-736h"};
  NSString *key = [NSString stringWithFormat:@"%dx%d",
                   (int)[UIScreen mainScreen].bounds.size.width,
                   (int)[UIScreen mainScreen].bounds.size.height];
  NSString *name = dict[key];
  return name;
}

+ (NSString *)nl_assetLaunchImagePath {
  NSString *name = [self nl_assetLaunchImageName];
  NSString *fileName = [NSString stringWithFormat:@"%@@%dx", name, (int)[UIScreen mainScreen].scale];
  NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
  return path;
}

+ (UIImage *)nl_assetLaunchImageNoCache {
  UIImage *launchImage = [UIImage imageWithContentsOfFile:[self nl_assetLaunchImagePath]];
  return launchImage;
}

@end
