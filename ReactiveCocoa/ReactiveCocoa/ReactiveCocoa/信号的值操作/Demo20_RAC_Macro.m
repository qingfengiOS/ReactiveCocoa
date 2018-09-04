//
//  Demo20_RAC_Macro.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo20_RAC_Macro.h"
#import <ReactiveObjC.h>

@interface Demo20_RAC_Macro ()

@end

@implementation Demo20_RAC_Macro

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RAC_Macro];
}


/**
 RAC(TARGET, ...)
 给某个对象的某个属性绑定信号，一旦信号产生数据，就会将内容赋值给属性!
 例如，textField绑定信号产生的数据是filed的text，将值赋值给label。完美！
 */
- (void)RAC_Macro {

    UITextField *textField = [[UITextField alloc] init];
    textField.frame =  CGRectMake(20, 200, 300, 40);
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor greenColor].CGColor;
    textField.placeholder = @"请点击输入内容";
    [self.view addSubview:textField];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame =  CGRectMake(20, 300, 300, 40);
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];

    RAC(label, text) = textField.rac_textSignal;
    
    //RACObserve(TARGET, KEYPATH)  监听的宏，返回的是个信号
    //下面监听的是label的text
    [RACObserve(label, text) subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
}



@end
