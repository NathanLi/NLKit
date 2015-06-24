//
//  NSObject+nl_associatedObject.m
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import "NSObject+nl_associatedObject.h"
#import <objc/runtime.h>

@implementation NSObject (nl_associatedObject)

- (void)nl_setAssociateValue:(id)value withKey:(void *)key
{
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)nl_setAssociateWeakValue:(id)value withKey:(void *)key
{
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)nl_setAssociateCopyValue:(id)value withKey:(void *)key {
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)nl_associatedValueForKey:(void *)key
{
  return objc_getAssociatedObject(self, key);
}
@end
