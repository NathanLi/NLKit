//
//  NSObject+Reflex.h
//  QinXin
//
//  Created by Nathan Li on 13-7-2.
//  Copyright (c) 2013年 Hoomic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflex)

/**
 *  是否包含父类的属性
 *
 *  @return 如果需要包含父类的属性，返回YES；否则返回NO。 默认返回YES
 */
+ (BOOL)isContainParentPropertyInReflex;
+ (NSArray *)propertyKeys;
/**
 *	@brief	从dataSource中构建出一个新的对象，该dataSource可以是一个NSDictionary或object
 */
+ (instancetype)objectFromDataSource:(NSObject *)dataSource;

/**
 *  从一个数组中构建出一个数组的当前对象，参数array的数据可是一个NSDictionary或object。
 *  如果无法解析成当前对象，忽略该对象。所以返回的当前对象的数组大小，小于等于参数array的大小。
 */
+ (NSMutableArray *)arrayFromDictionaries:(NSArray*)array;

/**
 *  从一个数组中构建出一个数组的当前对象，参数array的数据可是一个NSDictionary或object。
 *  如果无法解析成当前对象，则由NSNull代替。所以返回的当前对象的数组大小，等于参数array的大小
 */
+ (NSMutableArray *)arrayFromDictionariesContainNull:(NSArray *)array;

/**
 * 将dataSource里的属性复制过来，不会忽略相同的值。
 * @return 复制了属性的个数
 */
- (int)copyFromDataSouce:(NSObject *)dataSource;
- (int)copyFromDataSouce:(NSObject *)dataSource ignoreEqualValue:(BOOL)ignore;

// 将对象转换为一个dictionary
- (NSDictionary *)dictionary;
// 将对象转换为一个dictionary，并将为nil的值忽略（不会忽略为0的值）
- (NSDictionary *)dictionaryIgnoreEmptyValue:(BOOL)ignore;

/**
 *  @brief  将当前对象与另一对象对比，将有另一对象中与当前对象不同的字段输出到字典中
 *
 *  @param object 需要对比的对象
 *         containNull 是否在另一对象不存在与当前对象所对应的字段时，设置为null
 *
 *  @return 一个包含不同字段的字典
 */
- (NSMutableDictionary *)differentToDictionaryWithOtherObject:(id)object containNull:(BOOL)containNull;

@end