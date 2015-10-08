//
//  FAMenuVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAMenuVC.h"
#import "FALoginVC.h"
#import "FAMenuCell.h"
#import "AccountUtil.h"
@interface FAMenuVC ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *phoneCallBtn;

@end

@implementation FAMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.center = self.view.center;
    self.loginBtn.layer.borderWidth = 0.5;
    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginBtn.layer.cornerRadius = 3;
    
    self.phoneCallBtn.layer.borderWidth = 0.5;
    self.phoneCallBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.phoneCallBtn.layer.cornerRadius = 3;
    
//    if (isIphone6) {
//        self.tableView.rowHeight = 66;
//        CGRect rect = self.tableView.frame;
//        CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+60);
//        self.tableView.frame = newRect;
//    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (hasLogin && isLawer) {
        return 5;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
            cell = [FAMenuCell cellWithType:MenuCellTypeHome];
            break;
        case 1:
            cell = [FAMenuCell cellWithType:MenuCellTypeBid];
            break;
        case 2:
            cell = [FAMenuCell cellWithType:MenuCellTypeUser];
            break;
        case 3:
            cell = [FAMenuCell cellWithType:MenuCellTypeMore];
            break;
        case 4:
            cell = [FAMenuCell cellWithType:MenuCellTypeLawer];
            break;
        default:
            break;
    }
    
    
    
    //cell.backgroundColor = [UIColor redColor];
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
        case 4:
            title = @"lawer";
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
