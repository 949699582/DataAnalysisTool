//
//  ZHQReadFileView.h
//  MacTestApp
//
//  Created by zhq on 2021/3/8.
//  Copyright © 2021 zhq. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SHReadFileViewDelegate <NSObject>
 
- (void)receivedFileUrlList:(NSArray<NSURL *> *)fileUrls;
- (NSDragOperation)quaryDragOperation:(NSArray *)list;

@end

@interface ZHQReadFileView : NSView

@property (nonatomic,weak)id<SHReadFileViewDelegate>readDelegate;

@end

NS_ASSUME_NONNULL_END
