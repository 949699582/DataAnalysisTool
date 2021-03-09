//
//  BaseView.m
//  MacTestApp
//
//  Created by zhq on 2021/2/26.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    [self.layer setBackgroundColor:_color.CGColor];
}

@end
