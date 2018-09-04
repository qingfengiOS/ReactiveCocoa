//
//  Demo06_rac_addObserverForName.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo06_rac_addObserverForName.h"
#import <ReactiveObjC.h>

@interface Demo06_rac_addObserverForName ()

@end

@implementation Demo06_rac_addObserverForName

- (void)viewDidLoad {
    [super viewDidLoad];

    [self rac_addObserverForName];
}

- (void)rac_addObserverForName {
    UITextField *textField = [[UITextField alloc] init];
    textField.frame =  CGRectMake(20, 200, 300, 40);
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor greenColor].CGColor;
    textField.placeholder = @"监听键盘事件，请点击输入内容";
    [self.view addSubview:textField];
    
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIKeyboardDidShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        
        NSLog(@"%@",x);
    }];
}

/**
 默认的通知需要在这里移除观察者 但是RAC已经处理 不需要手动移除
 */
- (void)dealloc {
    NSLog(@"%@ dealloc resumed",NSStringFromClass([self class]));
}

@end
