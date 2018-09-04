//
//  Demo21_RACSubject_filter.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo21_RACSubject_filter.h"
#import <ReactiveObjC.h>

@interface Demo21_RACSubject_filter ()

@end

@implementation Demo21_RACSubject_filter

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSubject_filter];
}

- (void)RACSubject_filter {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame =  CGRectMake(20, 200, 300, 40);
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor greenColor].CGColor;
    textField.placeholder = @"请点击输入内容";
    [self.view addSubview:textField];
    
    //过滤
    [[textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        NSLog(@"value = %@,但是通过filter只有length > 3才发送信号",value);
        return  value.length > 3;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"发送的结果： %@",x);
    }];

}



@end
