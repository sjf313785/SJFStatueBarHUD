//
//  ViewController.m
//  SJFStatueBarHUD
//
//  Created by 史俊峰 on 16/11/1.
//  Copyright © 2016年 史俊峰. All rights reserved.

// 1.pod trunk register 313785087@qq.com 'shijunfeng' --description='The iMac of shijunfeng'
// 2.验证邮箱链接
// 3.检验是否安装成功 'pod trunk me'
// 4.

#import "ViewController.h"
#import "SJFStatueBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)message:(id)sender {
    
    [SJFStatueBarHUD showMessage:@"加载"];
}

- (IBAction)success:(id)sender {
    
    [SJFStatueBarHUD showSuccess:@"加载成功!"];
    
}
- (IBAction)fail:(id)sender {
    
    [SJFStatueBarHUD showError:@"加载失败!"];
    
}
- (IBAction)loading:(id)sender {
    
    [SJFStatueBarHUD showLoading:@"正在加载..."];
    
}
- (IBAction)hide:(id)sender {
    
    [SJFStatueBarHUD hide];
    
}
@end
