//
//  ViewController.m
//  ZMMEncryption
//
//  Created by miao on 2019/12/31.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ViewController.h"
#import "ZMMEncryptionModel.h"
#import "ZMMEncryptionCenter.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSDictionary *> *listDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据加密";
    self.listDatas = [ZMMEncryptionModel getUITableViewData];
    [self p_drawTableView];
}

#pragma mark - Private Methods

- (void)p_drawTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.alwaysBounceVertical = YES;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier01 = @"cellIdentifier01";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier01];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier01];
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13.f];
        
        //改变选中状态下背景样式
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.contentView.bounds];
        selectedBackgroundView.backgroundColor = [UIColor colorWithRed:162/255.0 green:210/255.0 blue:234/255.0 alpha:1.0];
        cell.selectedBackgroundView = selectedBackgroundView;
    }
    NSDictionary *dict = [self.listDatas objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:kCellTitle];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = [self.listDatas objectAtIndex:indexPath.row];
    NSString *moduleId = [dict objectForKey:kModuleID];
    ZMMEncryptionCenter *center = [ZMMEncryptionCenter sharedCenter];
    [center executeTheTestCodeWithModuleID:moduleId];

}



@end
