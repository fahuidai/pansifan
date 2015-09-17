//
//  FAMenuVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAMenuVC.h"
#import "FALoginVC.h"
@interface FAMenuVC ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FAMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title;
    switch (indexPath.row) {
        case 0:
            title = @"home";
            break;
        case 1:
            title = @"makebid";
            break;
        case 2:
            title = @"userdetail";
            break;
        case 3:
            title = @"more";
            break;
        default:
            break;
    }
    [self.delegate didSelectItem:title];
}
//登陆按钮
- (IBAction)loginBtn:(UIButton *)sender {
    
    FALoginVC *loginVC = [[FALoginVC alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController  presentViewController:loginVC animated:YES completion:nil];
}

- (IBAction)callUs:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"确定要拨打电话吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==1) {
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10000"]];
    }
    
}
@end
