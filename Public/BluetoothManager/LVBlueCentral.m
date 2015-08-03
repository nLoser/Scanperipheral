
//
//  LVBlueCentral.m
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import "LVBlueCentral.h"
#import "BLEInfo.h"

@interface LVBlueCentral ()<CBCentralManagerDelegate,CBPeripheralDelegate>
{
    
    CBCentralManager * _manager;
    
    NSMutableDictionary * _dicoverDataDic;

    BLEInfo * _bleInfo;
}
@end

@implementation LVBlueCentral

#pragma mark - CBCentral Deleagte Action

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn)
    {
        [_manager scanForPeripheralsWithServices:@[kBlueServiceUUID] options:@{CBCentralManagerScanOptionAllowDuplicatesKey:@YES}];
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSString * uuid = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
    if (uuid&&RSSI)
    {
        [_dicoverDataDic setValue:RSSI forKey:uuid];
    }
    NSString * dataPath = [kLVUserDefault objectForKey:kLVOne];
    
    NSFileHandle * handle = [NSFileHandle fileHandleForWritingAtPath:dataPath];
    [handle seekToEndOfFile];
    
    NSString * lat = [kLVUserDefault objectForKey:kLVLat];
    NSString * lng = [kLVUserDefault objectForKey:kLVlng];
    
    NSString * dataContent = [NSString stringWithFormat:@"\n%@ %@ %@ %@",uuid,RSSI,lat,lng];
    NSData * data = [dataContent dataUsingEncoding:NSUTF8StringEncoding];
    [handle writeData:data];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.ListDic(_dicoverDataDic);
    });
}

#pragma mark - start Scan

- (void)startCreateAndScan
{
    _dicoverDataDic = [[NSMutableDictionary alloc] init];
    _bleInfo = [[BLEInfo alloc] init];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    _manager = [[CBCentralManager alloc] initWithDelegate:self queue:queue];
}



#pragma mark - Life Cycle

+ (instancetype)sharedInstance
{
    static LVBlueCentral * instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LVBlueCentral alloc] init];
    });
    return instance;
}

@end
