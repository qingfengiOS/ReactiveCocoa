//
//  Demo35_RACSignal_combineLatest.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo35_RACSignal_combineLatest.h"
#import <ReactiveObjC.h>

@interface Demo35_RACSignal_combineLatest ()

@end

@implementation Demo35_RACSignal_combineLatest

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *usernameTextField = [[UITextField alloc] init];
    usernameTextField.frame =  CGRectMake(100, 100, 200, 40);
    usernameTextField.layer.borderWidth = 1.0f;
    usernameTextField.layer.borderColor = [UIColor redColor].CGColor;
    usernameTextField.placeholder = @"请输入用户名";
    [self.view addSubview:usernameTextField];
    
    UITextField *passwordTextField = [[UITextField alloc] init];
    passwordTextField.frame =  CGRectMake(100, 200, 200, 40);
    passwordTextField.layer.borderWidth = 1.0f;
    passwordTextField.layer.borderColor = [UIColor redColor].CGColor;
    passwordTextField.placeholder = @"请输入密码";
    [self.view addSubview:passwordTextField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 300, 200, 50);

    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [self.view addSubview:btn];
    
    //实现方式一：
//    [[RACSignal combineLatest:@[usernameTextField.rac_textSignal,passwordTextField.rac_textSignal] reduce:^id _Nonnull(NSString *name, NSString *password){
//        return @(name.length >= 3 && password.length >= 3);
//    }] subscribeNext:^(id  _Nullable x) {
//        btn.enabled = [x boolValue];
//    }];
    
//    实现方式二：
    RACSignal *signal = [RACSignal combineLatest:@[usernameTextField.rac_textSignal, passwordTextField.rac_textSignal] reduce:^id _Nonnull (NSString *name, NSString *password) {
        return @(name.length >= 3 && password.length >= 3);
    }];
    RAC(btn, enabled) = signal;
    
    // 通enable状态来设置背景色
    [RACObserve(btn, enabled) subscribeNext:^(id  _Nullable x) {
        if ([x boolValue]) {
            btn.backgroundColor = [UIColor greenColor];
        } else {
            btn.backgroundColor = [UIColor grayColor];
        }
    }];
    
}





@end
