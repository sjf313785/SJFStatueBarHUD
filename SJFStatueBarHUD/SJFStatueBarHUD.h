//
//  SJFStatueBarHUD.h
//  SJFStatueBarHUD
//
//  Created by 史俊峰 on 16/11/1.
//  Copyright © 2016年 史俊峰. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * 用法：
 * 1. 先导入头文件 #import "SJFStatueBarHUD.h"
 * 2. [SJFStatueBarHUD showMessage:@"加载信息"]    -》 加载普通信息
 * 3. [SJFStatueBarHUD showSuccess:@"加载成功!"]   -》 加载成功信息
 * 4. [SJFStatueBarHUD showError:@"加载失败!"]     -》 加载失败信息
 * 5. [SJFStatueBarHUD showLoading:@"正在加载..."] -》 正在加载信息
 * 6. [SJFStatueBarHUD hide]                      -》 隐藏
 */

@interface SJFStatueBarHUD : NSObject

/**
 *  显示普通信息
 *  @param msg      文字
 *  @param image    图片
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image;

/**
 *  显示正常信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏正在加载
 */
+ (void)hide;


@end
