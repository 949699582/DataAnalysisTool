//
//  YF_DataStorage.h
//  YFLegal
//
//  Created by xiongyw on 15/12/14.
//  Copyright © 2015年 xiongyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YF_DataStorage : NSObject

/**
 *  查找NSUserDefaults是否包含该key
 *
 *  @param key 关键字
 *
 *  @return 布尔
 */
+ (BOOL)hasObject:(NSString *)key;

/**
 *  保存值到NSUserDefaults
 *
 *  @param value 值
 *  @param key   关键字
 */
+ (void)saveObject:(id)value key:(NSString *)key;

/**
 *  从NSUserDefaults获取值
 *
 *  @param key 关键字
 *
 *  @return 对象
 */
+ (id)getObject:(NSString *)key;

/**
 *  移除某个值
 *
 *  @param key 关键字
 */
+ (void)removeObject:(NSString *)key;

@end
