//
//  AppDelegate.m
//  MacTestApp
//
//  Created by zhq on 2021/2/26.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSWindow *mainWindow = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    mainWindow.titleVisibility=NSWindowTitleHidden;
    NSRect frame = mainWindow.frame;
    frame.size=CGSizeMake(960, 540);
    [mainWindow setFrame:frame display:YES];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
