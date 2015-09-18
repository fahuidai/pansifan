//
//  FAHomeVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAHomeVC.h"
#import "FABidDetailVC.h"
#import "FABidCell.h"
#import "MJRefresh/MJRefresh.h"
@interface FAHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FAHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.tableView.header.automaticallyChangeAlpha = YES;

    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction: @selector(loadMoreData)];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FABidCell *cell = [FABidCell cellWithBid:nil for:tableView];
    return cell;
}
//选择某条时进入详细页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FABidDetailVC *bidVC = [[FABidDetailVC alloc]init];
    bidVC.bid = self.bids[indexPath.row];
    
    [self.navigationController pushViewController:bidVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 110;
}
- (void) refreshData{
    NSLog(@"刷新");
    [self.tableView.header endRefreshing];
}
- (void)loadMoreData {
    NSLog(@"加载更多");
    [self.tableView.footer endRefreshing];
}
@end
