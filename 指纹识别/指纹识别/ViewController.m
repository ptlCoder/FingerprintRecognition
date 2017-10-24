//
//  ViewController.m
//  指纹识别
//
//  Created by soliloquy on 2017/8/16.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

/*
 LAErrorAuthenticationFailed,    // 验证信息出错，就是说你指纹不对
 LAErrorUserCancel               // 用户取消了验证
 LAErrorUserFallback             // 用户点击了手动输入密码的按钮，所以被取消了
 LAErrorSystemCancel             // 被系统取消，就是说你现在进入别的应用了，不在刚刚那个页面，所以没法验证
 LAErrorPasscodeNotSet           // 用户没有设置TouchID
 LAErrorTouchIDNotAvailable      // 用户设备不支持TouchID
 LAErrorTouchIDNotEnrolled       // 用户没有设置手指指纹
 LAErrorTouchIDLockout           // 用户错误次数太多，现在被锁住了
 LAErrorAppCancel                // 在验证中被其他app中断
 LAErrorInvalidContext           // 请求验证出错
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LAContext *context = [[LAContext alloc]init];
//    context.localizedFallbackTitle = @"密码"; // 默认是： 输入密码
    BOOL result = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL];
    if (result) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹支付" reply:^(BOOL success, NSError * _Nullable error) {
            
            NSLog(@"success: %d--code: %ld", success, error.code);
            
            if (error) { // 验证失败
                switch (error.code) {
                    case LAErrorAuthenticationFailed: // 验证信息出错，就是说你指纹不对
                        
                        break;
                    case LAErrorUserCancel: // 用户取消了验证
                        
                        break;
                    case LAErrorUserFallback: // 用户点击了手动输入密码的按钮，所以被取消了
                        
                        break;
                    case LAErrorSystemCancel: // 被系统取消，就是说你现在进入别的应用了，不在刚刚那个页面，所以没法验证
                        
                        break;
                    case LAErrorPasscodeNotSet: // 用户没有设置TouchID
                        
                        break;
                    case LAErrorTouchIDNotAvailable: // 用户设备不支持TouchID
                        
                        break;
                    case LAErrorTouchIDNotEnrolled: // 用户没有设置手指指纹
                        
                        break;
                    case LAErrorTouchIDLockout: // 用户错误次数太多，现在被锁住了
                        
                        break;
                    case LAErrorAppCancel: // 在验证中被其他app中断
                        
                        break;
                    case LAErrorInvalidContext: // 请求验证出错
                        
                        break;
                    default:
                        break;
                }
            }else { // 验证成功
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   // 刷新UI
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"你是设备主人。" delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                });
                
            }
            
        }];
    }
}


@end
