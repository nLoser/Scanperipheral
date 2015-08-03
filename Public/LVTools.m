//
//  LVTools.m
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import "LVTools.h"

@implementation LVTools

/**
 * 创建用户UUID
 */
+ (NSString *)GetUUIDString
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString * uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}

/**
 * 根据Bluetooth的RSSI计算距离
 */
+ (float)GetcalcDistByRSSI:(int)rssi
{
    int iRssi = abs(rssi);
    float power = (iRssi-59)/(10*2.4);
    return pow(10, power);
}

/**
 * 获取Documents目录路径
 */
+ (NSString *)GetDocdir
{
    NSArray * docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirecotory = [docPath objectAtIndex:0];
    return documentsDirecotory;
}

/**
 * 创建文件夹
 * @return BOOL
 */
+ (BOOL)createFileDir:(NSString *)pathStr AndDirName:(NSString *)name
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * dataDirectory = [pathStr stringByAppendingPathComponent:name];
    BOOL result = [fileManager createDirectoryAtPath:dataDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    return result;
}













@end
