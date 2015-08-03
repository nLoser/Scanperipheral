//
//  ScanTableViewController.m
//  Scanperipheral
//
//  Created by LV on 15/7/17.
//  Copyright (c) 2015年 linkdow. All rights reserved.
//

#import "ScanTableViewController.h"
#import "LVBlueCentral.h"
#import "LVBluePeripheral.h"

@interface ScanTableViewController ()
{
    LVBlueCentral *_CentralManagr;
    LVBluePeripheral * _PerManager;
}
@property (nonatomic, strong) NSMutableDictionary * dataDic;

@end

@implementation ScanTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SB"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SB"];
    }
    
    return cell;
}

#pragma mark - Initlization

- (void)initBlueWEB
{
    _PerManager = [LVBluePeripheral shareInstance];
    [_PerManager createAndNotify];
    _CentralManagr = [LVBlueCentral sharedInstance];
    [_CentralManagr startCreateAndScan];
    
    __weak typeof(self) VCSelf = self;
    _CentralManagr.ListDic = ^(NSMutableDictionary * listDic)
    {
        VCSelf.dataDic = listDic;
    };
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initBlueWEB];
    
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithTitle:@"清空数据" style:UIBarButtonItemStyleDone target:self action:@selector(qingkong)];
    self.navigationItem.rightBarButtonItem = btn;
}

- (void)qingkong
{
    NSString * dataPath = [kLVUserDefault objectForKey:kLVOne];
    [@"" writeToFile:dataPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
