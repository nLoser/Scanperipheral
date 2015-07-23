//
//  AppDelegate+LVSet.m
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import "AppDelegate+LVSet.h"

@implementation AppDelegate (LVSet)

- (void)initlizationSet
{
    NSString * isLogin = [kLVUserDefault objectForKey:kLVUserisLogin];
    if (!isLogin)
    {
        //nil
        NSString * bluetoothUUID = [LVTools GetUUIDString];
        [kLVUserDefault setValue:bluetoothUUID forKey:kLVUserUUID];
        [kLVUserDefault setValue:@"1" forKey:kLVUserisLogin];
        //5F9CD991-F9A8-4C27-BC8A-D58741C055FE
    }
}

- (void)initCreateFile
{
    NSString * isAppOne = [kLVUserDefault objectForKey:kLVOne];
    
    if (!isAppOne)
    {
        NSString * documentsPath = [LVTools GetDocdir];
//        NSString * dataDirectory = [documentsPath stringByAppendingPathComponent:@"RSSIData"];
        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSString * testPath = [documentsPath stringByAppendingPathComponent:@"BlueTooth.txt"];
        
        BOOL res = [fileManager createFileAtPath:testPath contents:nil attributes:nil];
        if (res)
        {
            NSLog(@"文件创建成功:%@",testPath);
        }else
        {
            NSLog(@"文件创建失败");
        }
        [kLVUserDefault setValue:testPath forKey:kLVOne];
        NSLog(@"%@",[kLVUserDefault objectForKey:kLVOne]);
    }
    NSLog(@"%@",[kLVUserDefault objectForKey:kLVOne]);

}



@end
