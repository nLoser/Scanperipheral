//
//  LVTools.h
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVTools : NSObject

+ (NSString *)GetUUIDString;

+ (float)GetcalcDistByRSSI:(int)rssi;

+ (NSString *)GetDocdir;

+ (BOOL)createFileDir:(NSString *)pathStr AndDirName:(NSString *)name;

@end
