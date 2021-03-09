//
//  ZHQSaveManager.h
//  MacTestApp
//
//  Created by zhq on 2021/3/4.
//  Copyright © 2021 zhq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHQSaveManager : NSObject

+ (void)onjson:(id)obj savePath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
