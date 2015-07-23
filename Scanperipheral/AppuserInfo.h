//
//  AppuserInfo.h
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#ifndef Scanperipheral_AppuserInfo_h
#define Scanperipheral_AppuserInfo_h

#define kLVUserDefault [NSUserDefaults standardUserDefaults]

#define kLVOne         @"appOneLaunch" //@"0"为没有启动
#define kLVUserisLogin @"userIslogin"
#define kLVUserUUID    @"userBlueToothUUID"

#define kLVLat         @"userLocationLat"
#define kLVlng         @"userLocationLng"


#define kBlueCharactUUID [CBUUID UUIDWithString:[kLVUserDefault objectForKey:kLVUserUUID]] // 获取本身的UUID
#define kBlueServiceUUID [CBUUID UUIDWithString:@"5AD3B476-E924-47D5-98C0-04EC7B4FDB29"]

#endif
