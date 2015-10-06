//
//  FABidDetailVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FABidDetailVC.h"
#import "FAProgressLine.h"
#import "UMSocial.h"
@interface FABidDetailVC ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet FAProgressLine *progress;
@property (weak, nonatomic) IBOutlet UILabel *rate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *toolBtn;

@end

@implementation FABidDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"投标";
    // Do any additional setup after loading the view from its nib.
    UIButton *btnShare = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [btnShare setTitle:@"分享" forState:UIControlStateNormal];
    [btnShare addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnShare];
    
    self.view.backgroundColor = BackGroundColor;
    self.line.backgroundColor = BackGroundColor;
    FAProgressLine *progress = [[FAProgressLine alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.rate.frame)+13, ScreenSize.width-60-10, 10)];
    self.progress = progress;
    //设置进度条完成度
    
    [self.view addSubview:progress];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = NO;
    
    self.toolBtn.layer.cornerRadius = 3;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.progress.progress = 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *bidDetailCell = @"bidDetailVCCell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:bidDetailCell];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"投标人数";
        cell.detailTextLabel.text =@"9人";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text= @"项目描述";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 100, 30)];
    label.text = @"    详细信息";
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextAlignment:NSTextAlignmentLeft];
    return label;
}
- (void)share{
    [UMSocialSnsService presentSnsIconSheetView:self appKey:APPKey shareText:@"分享" shareImage:nil shareToSnsNames:@[UMShareToSina,UMShareToTencent,UMShareToRenren] delegate:self];
}
@end
