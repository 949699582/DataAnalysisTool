//
//  WebVC.m
//  MacTestApp
//
//  Created by zhq on 2021/3/1.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "WebVC.h"
#import <WebKit/WebKit.h>
#import "YF_DataStorage.h"

@interface WebVC ()<WKScriptMessageHandler>

@property (weak) IBOutlet WKWebView *webview;
@property (weak) IBOutlet WebView *webview1;

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSString *urlString = @"http://www.baidu.com";
    
    WKUserContentController *_userContentController = [[WKUserContentController alloc] init];
    // 遵守WKScriptMessageHandler协议。注册JS消息，name必须JS发送消息时的名字对应
    [_userContentController addScriptMessageHandler:self name:@"noParamsFunction"];
    [_userContentController addScriptMessageHandler:self name:@"haveParamsFunction"];

    WKWebViewConfiguration *_configuration = [[WKWebViewConfiguration alloc] init];
    _configuration.userContentController = _userContentController;

    
//    NSString *bundleStr = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil];
    NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.webview loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
//    NSURL *feedbackUrl = [NSURL fileURLWithPath:bundleStr];
        
//    [self.webview loadRequest:[NSURLRequest requestWithURL:feedbackUrl]];
    
//    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
//    [[self.webview1 mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
//    [self.webview1.layer setBackgroundColor:[NSColor orangeColor].CGColor];
    
    NSString *toVueSting = [YF_DataStorage getObject:@"ocToJSString"];

      NSString *jsStr = [NSString stringWithFormat:@"getDataFromNative('%@')",toVueSting];
      
      [self.webview evaluateJavaScript:jsStr completionHandler:^(id _Nullable d, NSError * _Nullable error) {

      NSLog(@"返回---%@",d);//回调值

      }];

}
- (IBAction)btnAction:(NSButton *)sender {
    NSLog(@"btn action");
    
    NSString *toVueSting = [YF_DataStorage getObject:@"ocToJSString"];

    NSString *jsStr = [NSString stringWithFormat:@"getDataFromNative('%@')",toVueSting];
    
    [self.webview evaluateJavaScript:jsStr completionHandler:^(id _Nullable d, NSError * _Nullable error) {

    NSLog(@"返回---%@",d);//回调值

    }];


}

#pragma mark --- WKScriptMessageHandler ---
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"message.name:%@", message.name);
    NSLog(@"message.body:%@", message.body);
}


@end
