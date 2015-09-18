//
//  FAMoreVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAMoreVC.h"
#import "IMPassWordView.h"
#import "AccountUtil.h"
#import "UIView+Animation.h"
@interface FAMoreVC ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) UISwitch *sw;
@end

@implementation FAMoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"更多";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"moreCell"];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"手势验证";
        UISwitch *sw = [[UISwitch alloc]init];
        self.sw = sw;
        [sw addTarget:self action:@selector(changePicPw) forControlEvents:UIControlEventValueChanged];
        if (isLogin && havePicPw) {
            [sw setOn:YES];
        }
        cell.accessoryView = sw;
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"新闻";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
                
            default:
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"公告";
                break;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (void)changePicPw{
    //如果是on的话说明当前登录用户已有手势密码，点击则是想关闭该功能，需要手势验证后删除手势
    if (!self.sw.on) {
        
        IMPassWordView *pwView = [[IMPassWordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [[UIApplication sharedApplication].keyWindow addSubviewFromBottom:pwView];
        __weak typeof(self) weakSelf = self;
        PassBlock pBlock = ^{
            [AccountUtil savePicPwString:nil];
            //[weakSelf loadView];
            [weakSelf.tableView reloadData];
        };
        pwView.passBlock = pBlock;
    }
    //否则是需要设置手势密码
    else {
        if (isLogin) {
            IMPassWordView *pwView = [[IMPassWordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [[UIApplication sharedApplication].keyWindow addSubviewFromBottom:pwView];
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请先登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            [self.tableView reloadData];
        }
    }
    
}

@end
