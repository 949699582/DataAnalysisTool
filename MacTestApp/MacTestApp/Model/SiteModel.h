//
//  SiteModel.h
//  MacTestApp
//
//  Created by zhq on 2021/2/27.
//  Copyright © 2021 zhq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SiteModel : NSObject

@property(nonatomic,copy)NSString *SerialNumber;
@property(nonatomic,copy)NSString *StartTime;
@property(nonatomic,copy)NSString *EndTime;

@end

NS_ASSUME_NONNULL_END
