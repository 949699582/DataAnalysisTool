//
//  YF_DataStorage.m
//  YFLegal
//
//  Created by xiongyw on 15/12/14.
//  Copyright © 2015年 xiongyw. All rights reserved.
//

#import "YF_DataStorage.h"

@implementation YF_DataStorage

+ (BOOL)hasObject:(NSString *)key
{
    id value = [self getObject:key];
    return value ? YES : NO;
}

+ (void)saveObject:(id)value key:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:value forKey:key];
    [prefs synchronize];
}

+ (id)getObject:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)removeObject:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
