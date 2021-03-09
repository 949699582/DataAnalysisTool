//
//  BaseView.h
//  MacTestApp
//
//  Created by zhq on 2021/2/26.
//  Copyright © 2021 zhq. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface BaseView : NSView

@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, assign) IBInspectable CGFloat radius;
@property (nonatomic, strong) IBInspectable NSColor *color;
@property (nonatomic, assign) IBInspectable BOOL fill;

@end

NS_ASSUME_NONNULL_END
