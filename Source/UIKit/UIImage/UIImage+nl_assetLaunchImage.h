//
//  UIImage+nl_launchImage.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/8/13.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  支持从Asset Catalog中读取launchImage
 *        因为目前iOS还没有API能直接读取asset catalog中的launchImage。
 *        
 *      refer:http://stackoverflow.com/questions/19107543/xcode-5-asset-catalog-how-to-reference-the-launchimage/20045142#20045142
 */
@interface UIImage (nl_assetLaunchImage)

+ (UIImage *)nl_assetLaunchImage;
+ (NSString *)nl_assetLaunchImageName;
+ (NSString *)nl_assetLaunchImagePath;
+ (UIImage *)nl_assetLaunchImageNoCache;

@end
