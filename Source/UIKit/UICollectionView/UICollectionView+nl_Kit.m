//
//  UICollectionView+nl_Kit.m
//  forums
//
//  Created by nathan@hoomic.com on 16/7/5.
//  Copyright © 2016年 hoomic. All rights reserved.
//

#import "UICollectionView+nl_Kit.h"

@implementation UICollectionView (nl_Kit)

+ (instancetype)nl_viewWithLayout:(UICollectionViewLayout *)layout builder:(void (^)(__kindof UICollectionView *collectionView))builder {
  NSParameterAssert(layout != nil);
  
  UICollectionView *collection = [[self alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
  if (builder) {
    builder(collection);
  }
  
  return collection;
}

@end
