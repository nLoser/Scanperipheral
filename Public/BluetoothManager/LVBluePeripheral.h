//
//  LVBluePeripheral.h
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVBluePeripheral : NSObject

+ (id)shareInstance;

- (void)createAndNotify;

@end
