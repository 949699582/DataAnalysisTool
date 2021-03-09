#import <Cocoa/Cocoa.h>
@protocol DragDropViewDelegate;

@interface DragDropImageView : NSImageView
@property (weak) id<DragDropViewDelegate> delegate;
@end

@protocol DragDropViewDelegate <NSObject>
-(void)dragDropViewFileDidReceiveList:(NSArray*)fileList;
@end
