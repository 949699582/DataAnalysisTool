//
//  ViewController.m
//  MacTestApp
//
//  Created by zhq on 2021/2/26.
//  Copyright © 2021 zhq. All rights reserved.
//

#import "ViewController.h"
#import "CHCSVParser.h"
#import "BaseView.h"
#import "QColorWell.h"
#import "YF_DataStorage.h"
#import "ZHQSandBoxPath.h"
#import "ZHQSaveManager.h"

#import "DragDropImageView.h"
#import "Masonry.h"
#import "WebVC.h"

#define TestItemsIndexJudgeParam @"Parametric"
#define Remove_SanBox 0
@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource,DragDropViewDelegate>

//接受文件拖拽的view
@property (nonatomic, strong) DragDropImageView *drapDropImageView;

@property (weak) IBOutlet NSView *topView;
@property (weak) IBOutlet BaseView *leftView;

@property (weak) IBOutlet NSTableView *leftTableview;
@property (weak) IBOutlet NSTableView *rightTableview;
@property (weak) IBOutlet NSScrollView *rightScrollView;
@property (weak) IBOutlet NSTableColumn *leftColorColumn;

@property(nonatomic,strong)NSArray *datas;


@property(nonatomic,strong)NSMutableArray *snDataArray; // sn 数据
@property(nonatomic,strong)NSMutableArray *leftArray; // sn 数据
@property(nonatomic,strong)NSMutableArray *testItemArray; // 测试

@property(nonatomic,strong)NSMutableArray *selectedRows; // 测试

@property(nonatomic,strong)NSMutableArray *rightSelectDatas;

@property(nonatomic,strong)NSMutableArray *rightSelectdIndexArray; // 右侧选择测试项index 数组

@property(nonatomic,strong)NSMutableArray *leftSelectIndexArray; // 左侧选中index数组

@property(nonatomic,strong)NSMutableArray *numerFlagArray;

@property(nonatomic,strong)NSMutableArray *rightSelectDatasResult;

@property(nonatomic,strong)NSArray *rows; // 测试

@end
@implementation ViewController
{
    NSMutableArray * _dataArray;
}

- (void)setupView {
    //设置接受拖动文件的view
    {
        //创建DragDropImageView
        self.drapDropImageView = [[DragDropImageView alloc] init];
        self.drapDropImageView.layer.backgroundColor = [NSColor orangeColor].CGColor;
        //设置代理
        self.drapDropImageView.delegate = self;
        //将创建的View添加到当前的View中
        [self.view addSubview:self.drapDropImageView];
        //设置DragDropImageView在当前View中的位置
        [self.drapDropImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.view);
            make.trailing.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }
}

#pragma mark DragDropImageViewDelegate
- (void)dragDropViewFileDidReceiveList:(NSArray *)fileList {
    //判断是否为空
    if(!fileList || [fileList count] <= 0)
        return;
    //暂时只支持单个文件
    [self processImportFile:fileList[0]];
}

//文件操作详细内容
- (void)processImportFile:(NSString *)fileUrl {
    //自己对文件的操作
    
    NSLog(@"fileUrl =%@",fileUrl);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    [YF_DataStorage saveObject:nil key:@"ocToJSString"];
    
    self.datas = [[NSArray alloc] init];
    _snDataArray = [[NSMutableArray alloc] init];
    _leftArray = [[NSMutableArray alloc] init];
    _testItemArray = [[NSMutableArray alloc] init];
    _selectedRows = [[NSMutableArray alloc] init];
    _rightSelectDatas = [[NSMutableArray alloc] init];
    _rows = [[NSArray alloc] init];
    
    _rightSelectdIndexArray = [[NSMutableArray alloc] init];
    _leftSelectIndexArray = [[NSMutableArray alloc] init];
    
    _numerFlagArray = [[NSMutableArray alloc] init];
    _rightSelectDatasResult = [[NSMutableArray alloc] init];
    
    for (int i = 0;i<100000;i++) {
        [_numerFlagArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    _rightFlagString = @"";
    
    _leftTableview.allowsMultipleSelection = YES;
    
    _leftTableview.gridColor = [NSColor redColor];
    self.datas = @[
        @{@"SerialNumber":@"john",@"StartTime":@"111",@"EndTime":@"test1"},
        @{@"SerialNumber":@"john2",@"StartTime":@"222",@"EndTime":@"test2"},
        @{@"SerialNumber":@"john3",@"StartTime":@"333",@"EndTime":@"test3"}
    ];
    
    // 加载数据
    [self getData];

#if Remove_SanBox
    
#endif
   
    
//    NSString *userName = NSUserName();
//    NSLog(@"userName:%@", userName);
//
//    NSString *homePath = NSHomeDirectory();
//    NSLog(@"home根目录:%@", homePath);
//    
//    NSString *openStepRootDirectoryPath = NSOpenStepRootDirectory();
//    NSLog(@"openStepRootDirectoryPath:%@", openStepRootDirectoryPath);
//    
//    NSString *vaultPath = [NSString stringWithFormat:@"%@vault/test/test/cest/",openStepRootDirectoryPath];
//    
//    NSURL *url = [NSURL URLWithString:vaultPath];
    
//    BOOL bookmarkDataIsStale;
//    NSData *bookmarkData =[url bookmarkDataWithOptions:NSURLBookmarkCreationWithSecurityScope includingResourceValuesForKeys:nil relativeToURL:nil error:NULL];
//    NSURL *allowedUrl = [NSURL URLByResolvingBookmarkData:bookmarkData options:NSURLBookmarkResolutionWithSecurityScope relativeToURL:nil bookmarkDataIsStale:&bookmarkDataIsStale error:NULL];
//    @try {
//        [allowedUrl startAccessingSecurityScopedResource];
//        NSLog(@"开始连接");
//    } @catch (NSException *exception) {
//        NSLog(@"有异常");
//    } @finally {
//        [allowedUrl stopAccessingSecurityScopedResource];
//        NSLog(@"结束连接");
//    }
    
//    [ZHQSaveManager onjson:nil savePath:openStepRootDirectoryPath];
    
    
    
    // 删除沙盒数据
//    NSString *doucumentsPath = [ZHQSandBoxPath getDocumentDirectory];
//    NSLog(@"doucumentsPath =%@",doucumentsPath);
//
//    NSString *filePath = [doucumentsPath stringByAppendingPathComponent:@"Desopdict.json"];
//    NSLog(@"filePath =%@",filePath);
//
//
//    BOOL isClear = [ZHQCleanCaches clearCachesWithFilePath:filePath];
//    if (isClear) {
//        NSData *dataResult = [NSData dataWithContentsOfFile:filePath];
//        NSLog(@"dataResult =%@",[[NSString alloc] initWithData:dataResult encoding:NSUTF8StringEncoding]);
//
//
//    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    if (tableView == self.leftTableview) {
        return [self.leftArray count];
    }else{
        return [self.testItemArray count];
    }
}


-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if (tableView == self.leftTableview) {
        NSDictionary *data = self.leftArray[row];
        NSString *key = tableColumn.identifier;
        NSString *value = data[key];
        return value;
    }else{
        
        NSDictionary *data = self.testItemArray[row];
        NSString *key = tableColumn.identifier;
        NSString *value = data[key];
        
        return value;
    }
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if (tableView == self.leftTableview) {
        // 获取row数据
        NSDictionary *data = self.leftArray[row];
        // 表格列的标识
        NSString *identifier = tableColumn.identifier;
        
        
        //        NSLog(@"%@",identifier);
        
        // 单元格数据
        NSString *value = data[identifier];
        
        // 根据表格列的标识,创建单元视图
        NSView *view = [tableView makeViewWithIdentifier:identifier owner:self];
        NSArray *subviews = [view subviews];
        
        if ([identifier isEqualToString:@"Color"]) {
            if (view) {
                
                //                NSLog(@"进来这里了");
                NSColorWell *colorWell = (NSColorWell *)view;
                //                colorWell.bordered = NO;
                colorWell.color = [NSColor redColor];
                [colorWell addObserver:self forKeyPath:@"color" options:0 context:NULL];
            }
        }
        
        
        if ([subviews count] > 0) {
            if ([identifier isEqualToString:@"SerialNumber"] || [identifier isEqualToString:@"StartTime"] || [identifier isEqualToString:@"EndTime"]) {
                NSTextField *textfField = subviews[0];
                if (value) {
                    //更新单元格
                    textfField.stringValue = value;
                }
            }
            
        }
        return view;
    }else{
        
        // 获取row数据
        NSDictionary *data = self.testItemArray[row];
        
        
        // 表格列的标识
        NSString *identifier = tableColumn.identifier;
        // 单元格数据
        NSString *value = data[identifier];
        // 根据表格列的标识,创建单元视图
        NSView *view = [tableView makeViewWithIdentifier:identifier owner:self];
        NSArray *subviews = [view subviews];
        
        if ([subviews count] > 0) {
            if ([identifier isEqualToString:TestItemsIndexJudgeParam]) {
                
                NSTextField *textfField = subviews[0];
                if (value) {
                    //更新单元格
                    textfField.stringValue = value;
                }
            }
        }
        return view;
    }
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    if (notification.object == self.rightTableview) {
        
        [_rightSelectDatas removeAllObjects];
        NSInteger row = [notification.object selectedRow];
        NSLog(@"right =%ld",row);
        
        NSDictionary *data = self.testItemArray[row];
        NSString *str = data[TestItemsIndexJudgeParam];
        
        NSLog(@"str =%@",str);
        
        // 获取该测试项名字的首个Index
        NSInteger flag = row;
        for (NSInteger i = row; i<[self.rows[1] count]; i++) {
            NSString *testItemName = self.rows[1][i+12];
            
            NSArray *arraySeparate = [testItemName componentsSeparatedByString:@"@"];
            
            NSString *left_testItemName = arraySeparate[0];
            if ([str isEqualToString:left_testItemName]) {
                
                NSLog(@"row ===%ld",i);
                flag = i;
                break;
            }
        }

        NSInteger x = flag + 1;
        for (NSUInteger i = x; i<[self.rows[1] count]; i++) {
            NSString *testItemName = self.rows[1][i+12];
            
//            NSLog(@"testItemName =%@",testItemName);
            
            NSArray *arraySeparate = [testItemName componentsSeparatedByString:@"@"];
            
            NSString *left_testItemName = arraySeparate[0];
            
//            NSLog(@"left_testItemName =%@",left_testItemName);
            
            if (i+1 < [self.rows[1] count]-12) {
                
                if (![str isEqualToString:left_testItemName]) {
                    break;
                }else{
                    flag++;
                }
            }
        }
        
        NSLog(@"flagIndex =%ld", flag);
        
        if (_leftSelectIndexArray.count == 0) {
            NSLog(@"请先选择测试产品");
            return;
        }else{
            NSLog(@"开始处理数据");
            
            
            for (int i = 0; i<_leftSelectIndexArray.count; i++) {
                int x = [_leftSelectIndexArray[i] intValue];
                NSLog(@"%d",x);
                
                for (int y = 7+x; y<self.rows.count; y++) {
                    NSArray *array = self.rows[y];
                    
                    for (NSInteger z = row+12; z<flag; z++) {
                        [_rightSelectDatasResult addObject:array[z]];
                    }
                }
            }
        }
        
        if (_rightSelectDatasResult.count != 0) {
//            NSLog(@"_rightSelectDatasResult =%@",_rightSelectDatasResult);
            
//            [self onjson];

        }
        
        
#pragma mark - 开始跳转折现图页面
//        for (int i = 7; i<_rows.count; i++) {
//
//            NSDictionary *dict = _rows[i][row+12];
//            //            NSLog(@"dict =%@",dict);
////            [dict setObject:_rows[7][row+12] forKey:@"str"];
//            [dict setValue:_rows[7][row+12] forKey:@"str"];
//
//            [_rightSelectDatas addObject:dict];
//        }
        
//        NSString *ocToHtmlString = [self gs_jsonStringCompactFormatForNSArray:_rightSelectDatas];
        //        NSLog(@"string =%@",ocToHtmlString);
        
        NSString *ocToHtmlString1 = [self objArrayToJSON:_rightSelectDatasResult];
//                NSLog(@"string1 =%@",ocToHtmlString1);
        
        [YF_DataStorage saveObject:ocToHtmlString1 key:@"ocToJSString"];
        
        // 数据处理
        //        for (int i = 7; i<[self.rows count]; i++) {
        //            NSArray *array = self.rows[i];
        //            NSLog(@"array =%@",array);
        //
        ////            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        ////
        ////            [dictionary setObject:array[12+row] forKey:@"SerialNumber"];
        ////
        ////            [self.rightSelectDatas addObject:dictionary];
        //        }
        
    }else{
        [_leftSelectIndexArray removeAllObjects];
        
        NSInteger row = [notification.object selectedRow];
        
        NSLog(@"left =%ld",row);
        
        // 选中的多行数据
        NSIndexSet *set = [notification.object selectedRowIndexes];
        
        NSArray *result = [_numerFlagArray objectsAtIndexes:set];
        
        [result enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,BOOL *stop) {
            
            NSLog(@"%@",obj);
            
            [_leftSelectIndexArray addObject:obj];
        }];
    }
}

#pragma -mark - 从文件读取全部数据
- (void)getData{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *fileURL = [bundle URLForResource:@"FACTData01" withExtension:@"csv"];
    
    // 1.0 rows 数组里面包含了csv文件里面的所有数据
    _rows = [NSArray arrayWithContentsOfCSVURL:fileURL];
    
    // 2.0 产品数据处理
    for (int i = 7; i<self.rows.count; i++) {
        NSArray *array = self.rows[i];
        
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:array[2] forKey:@"SerialNumber"];
        [dictionary setObject:array[8] forKey:@"StartTime"];
        [dictionary setObject:array[9] forKey:@"EndTime"];
        
        [self.leftArray addObject:dictionary];
    }
    
    // 3.0  读取测试项开始坐标
    for (int i = 0; i<[self.rows[0] count]; i++) {
        NSString *flagString = self.rows[0][i];
        if ([flagString isEqualToString:TestItemsIndexJudgeParam]) {
            self.testItemFlagIndex = i;
            //            NSLog(@"%@ Index =%d",TestItemsIndexJudgeParam,i);
            break;
        }
    }
    
    // 3.1 开始解析测试项数据
    for (int i = self.testItemFlagIndex; i<[self.rows[2] count]; i++) {
        NSString *testItemName = self.rows[1][i];
        //        NSLog(@"testItemName =%@",testItemName);
        
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        
        if (![testItemName containsString:@"@"]) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            [dictionary setObject:testItemName forKey:TestItemsIndexJudgeParam];
            [dictionary setObject:array forKey:@"TestItemIndexs"];
            [self.testItemArray addObject:dictionary];
        }else{
            
            NSArray *arraySeparate = [testItemName componentsSeparatedByString:@"@"];
            
            NSString *left_testItemName = arraySeparate[0];
            
            //            NSLog(@"right index =%d", i);
            
            //            if ((i+1) != [self.rows[2] count]) {
            //                NSString *testItemName1 = self.rows[1][i+1];
            //                NSLog(@"%@",testItemName1);
            //
            //                if ([testItemName isEqualToString:testItemName1]) {
            //                    [array addObject:@(i)];
            //                }else{
            //                    [dictionary setObject:array forKey:@"TestItemIndexs"];
            //                }
            //            }
            
            // 处理测试项的@
            if (![left_testItemName isEqualToString:_rightFlagString]) {
                
                [dictionary setObject:left_testItemName forKey:TestItemsIndexJudgeParam];
                //                [dictionary setObject:array forKey:@"TestItemIndexs"];
                [self.testItemArray addObject:dictionary];
                
            }
            
            _rightFlagString = left_testItemName;
        }
    }
    
    [self.leftTableview reloadData];
    [self.rightTableview reloadData];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //    sRGB IEC61966-2.1 colorspace 1 0.252792 1 1
    
    QColorWell *colorWell = (QColorWell *)object;
    NSLog(@"color =%@",colorWell.color);
}

- (IBAction)btnAction:(NSButton *)sender {
    
    NSLog(@"按钮被点击了");
    
}

// 将数组转为json字符串
- (NSString *)gs_jsonStringCompactFormatForNSArray:(NSArray *)arrJson {
    
    if (![arrJson isKindOfClass:[NSArray class]] || ![NSJSONSerialization isValidJSONObject:arrJson]) {
        
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrJson options:0 error:nil];
    
    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return strJson;
    
}

//把多个json字符串转为一个json字符串

- (NSString *)objArrayToJSON:(NSArray *)array {
    
    NSString *jsonStr = @"[";
    
    for (NSInteger i = 0; i < array.count; ++i) {
        
        if (i != 0) {
            
            jsonStr = [jsonStr stringByAppendingString:@","];
            
        }
        
        jsonStr = [jsonStr stringByAppendingString:array[i]];
        
    }
    jsonStr = [jsonStr stringByAppendingString:@"]"];
    return jsonStr;
    
}



@end
