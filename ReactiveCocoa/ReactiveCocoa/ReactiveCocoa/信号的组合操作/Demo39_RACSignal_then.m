//
//  Demo39_RACSignal_then.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo39_RACSignal_then.h"
#import <ReactiveObjC.h>

@interface Demo39_RACSignal_then ()

@end

@implementation Demo39_RACSignal_then

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RACSignal_then];
}

- (void)RACSignal_then {
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        [subscriber sendNext:@"3"];
        [subscriber sendCompleted];
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"A"];
        [subscriber sendNext:@"B"];
        [subscriber sendCompleted];
        
        return nil;
    }];
    
    //忽略前面的信号，a信号数据发送完毕，忽略完毕，接收b的数据。
    //b的信号依赖a发送完毕。对于a的结果不关心，直接忽略掉！ 所以signalA发送任何信号对signal的结果不影响
    RACSignal *signal = [signalA then:^RACSignal * _Nonnull{
        return signalB;
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}



@end
