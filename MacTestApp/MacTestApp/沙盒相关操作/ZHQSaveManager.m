//
//  ZHQSaveManager.m
//  MacTestApp
//
//  Created by zhq on 2021/3/4.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "ZHQSaveManager.h"
#import "ZHQSandBoxPath.h"

@implementation ZHQSaveManager




+ (void)onjson:(id)obj savePath:(NSString *)path{
    
    // 如果数组或者字典中存储了  NSString, NSNumber, NSArray, NSDictionary, or NSNull 之外的其他对象,就不能直接保存成文件了.也不能序列化成 JSON 数据.
    
    NSDictionary *dict = @{@"name" : @"me", @"do" : @"something", @"with" : @"her", @"address" : @"home"};
    
    // 1.判断当前对象是否能够转换成JSON数据.
    
    // YES if obj can be converted to JSON data, otherwise NO
    
    BOOL isYes = [NSJSONSerialization isValidJSONObject:dict];
    
    
    if (isYes) {
        
        NSLog(@"可以转换");
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
        
        
        //        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        //储存文件名称+格式
        
        NSString *savePath = [path stringByAppendingPathComponent:@"/vault/test/test/Desopdict.json"];
        
        NSLog(@"savePath is SY:%@",savePath);
        
        //判断createPath路径文件夹是否已存在，此处createPath为需要新建的文件夹的绝对路径
        if ([[NSFileManager defaultManager] fileExistsAtPath:savePath]) {
            //文件夹已存在
            NSLog(@"文件已经存在");
            
        } else {
            //创建文件夹
            NSLog(@"文件没有存在");
            [[NSFileManager defaultManager] createFileAtPath:savePath contents:jsonData attributes:nil];
            
        }
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([[NSFileManager defaultManager] fileExistsAtPath:savePath]) {
                //文件夹已存在
                NSLog(@"文件已经存在");
                
            } else {
                //创建文件夹
                NSLog(@"文件没有存在");
                
            }
        });
        
        
        //        BOOL isSuccess = [jsonData writeToFile:savePath atomically:YES];
        //
        //        if (isSuccess) {
        //            NSLog(@"成功");
        //        }else{
        //            NSLog(@"失败");
        //        }
        
        //        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        //
        //
        //        NSString *doucumentsPath = [ZHQSandBoxPath getDocumentDirectory];
        //        NSLog(@"doucumentsPath =%@",doucumentsPath);
        //
        //
        //
        //        NSString *filePath = [doucumentsPath stringByAppendingPathComponent:@"Desopdict.json"];
        //        NSLog(@"filePath =%@",filePath);
        //
        //        NSData *dataResult = [NSData dataWithContentsOfFile:filePath];
        //        NSLog(@"dataResult =%@",[[NSString alloc] initWithData:dataResult encoding:NSUTF8StringEncoding]);
        
        
    } else {
        
        NSLog(@"JSON数据生成失败，请检查数据格式");
    }
}



@end
