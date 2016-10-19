//
//  NSObject+Reflex.m
//  QinXin
//
//  Created by Nathan Li on 13-7-2.
//  Copyright (c) 2013年 Hoomic. All rights reserved.
//

#import "NSObject+Reflex.h"
#import <objc/runtime.h>

typedef objc_property_t Property;

@implementation NSObject (Reflex)

+ (BOOL)isContainParentPropertyInReflex {
  return YES;
}

+ (NSArray *)propertyKeys {
  unsigned int count;
  Property *properties = class_copyPropertyList(self, &count);
  NSMutableArray  *keys = [[NSMutableArray alloc] initWithCapacity:count];
  
  for (int index = 0; index < count; ++index) {
    Property property = properties[index];
    NSString *propertyName = [NSString stringWithCString:property_getName(property)
                                                encoding:NSUTF8StringEncoding];
    [keys addObject:propertyName];
  }
  
  free(properties);
  
  Class superClass = class_getSuperclass(self);
  if ([self isContainParentPropertyInReflex]) {
    const char *superName = class_getName(superClass);
    if (strcmp(superName, class_getName([NSObject class]))) {
      NSArray *superKeys = [superClass propertyKeys];
      [keys addObjectsFromArray:superKeys];
    }
  }
  
  return keys;
}

+ (instancetype)objectFromDataSource:(NSObject *)dataSource {
  NSObject *object = [[self alloc] init];
  
  int count = [object copyFromDataSouce:dataSource];
  if (count == 0) {
    return nil;
  }
  
  return object;
}

+ (NSMutableArray  *)arrayFromDictionaries:(NSArray*)array {
  NSMutableArray *objs = [[NSMutableArray alloc] initWithCapacity:0];
  [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    id model = [self objectFromDataSource:obj];
    if (model) {
      [objs addObject:model];
    }
  }];
  
  if ([objs count] == 0) {
    return nil;
  }
  
  return objs;
}

+ (NSMutableArray *)arrayFromDictionariesContainNull:(NSArray *)array {
  NSMutableArray *objs = [[NSMutableArray alloc] initWithCapacity:0];
  [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    id model = [self objectFromDataSource:obj];
    if (model) {
      [objs addObject:model];
    } else {
      [objs addObject:[NSNull null]];
    }
  }];
  
  if ([objs count] == 0) {
    return nil;
  }
  
  return objs;
}

- (int)copyFromDataSouce:(NSObject *)dataSource {
  return [self copyFromDataSouce:dataSource ignoreEqualValue:NO];
}

- (int)copyFromDataSouce:(NSObject *)dataSource ignoreEqualValue:(BOOL)ignore {
  int count = 0;
  
  for (NSString *key in [self.class propertyKeys]) {
    BOOL isProperty = NO;
    if ([dataSource isKindOfClass:[NSDictionary class]]) {
      isProperty = ([dataSource valueForKey:key] == nil) ? NO : YES;
    } else {
      isProperty = [dataSource respondsToSelector:NSSelectorFromString(key)];
    }
    
    if (isProperty) {
      id propertyValue = [dataSource valueForKey:key];
      // 如果有值
      if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue != nil) {
        // 是否忽略相同的值
        
        id thisPropertyValue = [self valueForKey:key];
        if (ignore && [thisPropertyValue isEqual:propertyValue]) {
          continue;
        } else {
          [self setValue:propertyValue forKey:key];
          count++;
        }

      }
    }
  }
  
  return count;
}

- (NSDictionary *)dictionary {
  return [self dictionaryIgnoreEmptyValue:NO];
}

- (NSDictionary *)dictionaryIgnoreEmptyValue:(BOOL)ignore {
  NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
  NSArray *keys = [self.class propertyKeys];
  for (NSString *key in keys) {
    NSObject *value = [self valueForKey:key];
    if (value != nil) {
      [dic setObject:value forKey:key];
    }
    
    if (value == nil && !ignore) {
      [dic setObject:@"" forKey:key];
    }
  }
  
  return dic;
}

- (NSMutableDictionary *)differentToDictionaryWithOtherObject:(id)object containNull:(BOOL)containNull {
  if (self == object) return nil;
  
  NSMutableDictionary *dic = [NSMutableDictionary dictionary];
  NSArray *keys = [self.class propertyKeys];
  for (NSString *key in keys) {
    NSObject *selfValue = [self valueForKey:key];
    NSObject *otherValue = [object valueForKey:key];
    
    if (selfValue == nil && otherValue != nil) {
      [dic setObject:otherValue forKey:key];
    }
    
    if (selfValue && ![selfValue isEqual:otherValue]) {
      if (otherValue) {
        [dic setObject:otherValue forKey:key];
      } else if (containNull) {
        [dic setObject:[NSNull null] forKey:key];
      }
    }
    
  }
  
  if ([[dic allKeys] count] > 0) {
    return dic;
  }
  return nil;
}

@end
