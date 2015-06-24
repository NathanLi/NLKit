//
//  NSObject+nl_associatedObject.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/11.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (nl_associatedObject)

- (void)nl_setAssociateValue:(id)value withKey:(void *)key; // Strong reference
- (void)nl_setAssociateWeakValue:(id)value withKey:(void *)key;
- (void)nl_setAssociateCopyValue:(id)value withKey:(void *)key;
- (id)nl_associatedValueForKey:(void *)key;

@end
