//
//  ZHQSandBoxPath.m
//  MacTestApp
//
//  Created by zhq on 2021/3/4.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "ZHQSandBoxPath.h"

@implementation ZHQSandBoxPath

#pragma mark - 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory{
    return
    NSTemporaryDirectory();
}

@end
