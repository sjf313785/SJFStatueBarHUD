//
//  SJFStatueBarHUD.m
//  SJFStatueBarHUD
//
//  Created by 史俊峰 on 16/11/1.
//  Copyright © 2016年 史俊峰. All rights reserved.
//

#import "SJFStatueBarHUD.h"

@implementation SJFStatueBarHUD

static UIWindow *window_;
static NSTimer *timer_;

/**
 *  创建Window窗口
 */
+ (void)setupWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:0.25 animations:^{
       
        window_.frame = frame;
        
    }];
}

/**
 *  显示普通信息
 *  @param msg      文字
 *  @param image    图片
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image
{
    [timer_ invalidate];
    
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:nil];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg withImage:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg withImage:[UIImage imageNamed:@"SJFStatueBarHUD.bundle/success"]];
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg withImage:[UIImage imageNamed:@"SJFStatueBarHUD.bundle/fail"]];
}

/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)msg{
    
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //算出文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) / 2 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.frame = window_.bounds;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    
}

/**
 *  隐藏正在加载
 */
+ (void)hide{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
        
    }];
    
}

@end
