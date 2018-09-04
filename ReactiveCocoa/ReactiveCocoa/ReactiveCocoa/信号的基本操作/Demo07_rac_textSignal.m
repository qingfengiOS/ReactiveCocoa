//
//  Demo07_rac_textSignal.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo07_rac_textSignal.h"
#import <ReactiveObjC.h>

@interface Demo07_rac_textSignal ()

@end

@implementation Demo07_rac_textSignal

- (void)viewDidLoad {
    [super viewDidLoad];

    [self rac_textSignal];
}

- (void)rac_textSignal {
    UITextField *textField = [[UITextField alloc] init];
    textField.frame =  CGRectMake(20, 200, 300, 40);
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor greenColor].CGColor;
    textField.placeholder = @"请点击输入内容";
    [self.view addSubview:textField];
    
    [textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"x = %@", x);
    }];
}


@end
