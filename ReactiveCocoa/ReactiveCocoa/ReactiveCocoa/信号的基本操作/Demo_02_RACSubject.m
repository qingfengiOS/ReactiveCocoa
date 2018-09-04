//
//  Demo_02_RACSubscriber.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/29.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo_02_RACSubject.h"
#import <ReactiveObjC.h>

@interface Demo_02_RACSubject ()

@end

@implementation Demo_02_RACSubject

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"\nRACSubject 信号提供者, 自己可以充当信号，又能发送信号.\n继承自RACSignalm，实现了RACSubscriber协议");
    [self RACSubject];
    
}

/**
 RACSubject 信号提供者, 自己可以充当信号，又能发送信号
 继承自RACSignalm，实现了RACSubscriber协议
 */
- (void)RACSubject {
    RACSubject *subject = [RACSubject subject];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"1-%@\n",x);
    }];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"2-%@\n",x);
    }];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"3-%@\n",x);
    }];
    
    [subject sendNext:@"hello"];
}


@end
