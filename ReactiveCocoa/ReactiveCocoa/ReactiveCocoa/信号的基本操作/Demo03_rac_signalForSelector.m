//
//  Demo03_rac_signalForSelector.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo03_rac_signalForSelector.h"
#import <ReactiveObjC.h>
#import "RACView.h"

@interface Demo03_rac_signalForSelector ()

@end

@implementation Demo03_rac_signalForSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rac_signalForSelector];
}


/**
 RAC替换target-action模式 处理UI事件
 */
- (void)rac_signalForSelector {
    
    RACView *view = [[RACView alloc]initWithFrame:CGRectMake(50, 100, 100, 50)];
    [self.view addSubview:view];
    
    [[view rac_signalForSelector:NSSelectorFromString(@"click:")]subscribeNext:^(RACTuple * _Nullable x) {//这里的X是个元组
        UIButton *btn = x[0];
        btn.backgroundColor = [UIColor greenColor];
        
        NSLog(@"按钮被点击了-->%@",x);
    }];
}

@end
