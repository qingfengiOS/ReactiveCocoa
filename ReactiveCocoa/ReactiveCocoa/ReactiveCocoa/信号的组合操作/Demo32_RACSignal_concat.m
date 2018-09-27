//
//  Demo32_RACSignal_concat.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo32_RACSignal_concat.h"
#import <ReactiveObjC.h>

@interface Demo32_RACSignal_concat ()

@end

@implementation Demo32_RACSignal_concat

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_concat];
}

/// 信号串联
- (void)RACSignal_concat {
    //按一定顺序执行
    /*
     concat底层实现:
     1.当拼接信号被订阅，就会调用拼接信号的didSubscribe
     2.didSubscribe中会先订阅第一个源信号（signalA）
     3.会执行第一个源信号（signalA）的didSubscribe
     4.第一个源信号（signalA）didSubscribe中发送值，就会调用第一个源信号（signalA）订阅者的nextBlock,通过拼接信号的订阅者把值发送出来.
     5.第一个源信号（signalA）didSubscribe中发送完成，就会调用第一个源信号（signalA）订阅者的completedBlock,订阅第二个源信号（signalB）这时候才激活（signalB）。
     6.订阅第二个源信号（signalB）,执行第二个源信号（signalB）的didSubscribe
     7.第二个源信号（signalA）didSubscribe中发送值,就会通过拼接信号的订阅者把值发送出来.
     */
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"A"];
        
        //告诉A发送完毕，组合信号才走下面的信号
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"B"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signalC = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"C"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //创建组合信号 concat，按顺序组合
    //按照A C B 顺序执行
    RACSignal *contactSignal = [RACSignal concat:@[signalA,signalC,signalB]];
    
    //订阅组合信号
    [contactSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"contactSignal x = %@", x);
    }];
    
}




@end
