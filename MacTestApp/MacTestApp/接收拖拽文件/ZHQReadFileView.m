//
//  ZHQReadFileView.m
//  MacTestApp
//
//  Created by zhq on 2021/3/8.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "ZHQReadFileView.h"

@implementation ZHQReadFileView

- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        //注册文件拖动事件
        if (@available(macOS 10.13, *)) {
            [self registerForDraggedTypes:[NSArray arrayWithObjects:NSPasteboardTypeFileURL, nil]];
        } else if (@available(macOS 10.0, *)){
            // Fallback on earlier versions
            [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
        }
    }
    return self;
}
 
- (void)awakeFromNib {
    [super awakeFromNib];
    //注册文件拖动事件
    if (@available(macOS 10.13, *)) {
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSPasteboardTypeFileURL, nil]];
    } else if (@available(macOS 10.0, *)){
        // Fallback on earlier versions
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
    }
}
 
- (void)dealloc {
    [self unregisterDraggedTypes];
}
 
//当文件被拖动到界面触发
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
    
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
    if (@available(macOS 10.13, *)) {
        if ( [[pboard types] containsObject:NSPasteboardTypeFileURL] ) {
            if (sourceDragMask & NSDragOperationLink) {
                NSArray *list = [pboard readObjectsForClasses:@[[NSURL class]] options:nil];
                return [self.readDelegate quaryDragOperation:list];
            } else if (sourceDragMask & NSDragOperationCopy) {
                return NSDragOperationCopy;//拖动会变成+号
            }
        }
    } else {
        if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
            if (sourceDragMask & NSDragOperationLink) {
                NSArray *list = [pboard propertyListForType:NSFilenamesPboardType];
                //[pboard readObjectsForClasses:@[[NSURL class]] options:nil];
                return [self.readDelegate quaryDragOperation:list];
            } else if (sourceDragMask & NSDragOperationCopy) {
                return NSDragOperationCopy;//拖动会变成+号
            }
        }
    }
    return NSDragOperationNone;
}
 
//当文件在界面中放手
-(BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender{
    NSPasteboard *zPasteboard = [sender draggingPasteboard];
    NSArray *list;
    if (@available(macOS 10.13, *)) {
        //获取的路径看不懂，需要通过bookmark才能转成能看懂的磁盘路径
        list = [zPasteboard readObjectsForClasses:@[[NSURL class]] options:nil];
    } else {
        list = [zPasteboard propertyListForType:NSFilenamesPboardType];
    }
     
    NSMutableArray *urlList = [NSMutableArray array];
    for (NSObject *obj in list) {
        if ([obj isKindOfClass:[NSURL class]]) {
            [urlList addObject:(NSURL *)obj];
        } else if ([obj isKindOfClass:[NSString class]]) {
            NSURL *url = [NSURL fileURLWithPath:(NSString *)obj];
            [urlList addObject:url];
        }
    }
    if (urlList.count && self.readDelegate) {
        [self.readDelegate receivedFileUrlList:urlList];
    }
    return YES;
}

@end
