//
//  Demo29_RACSignal_aggregate.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/10.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo29_RACSignal_aggregate.h"
#import <ReactiveObjC.h>

@interface Demo29_RACSignal_aggregate ()

@end

@implementation Demo29_RACSignal_aggregate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self RACSignal_aggregate];
}


/**
 以初始值为基础 把数组里面每个元素依次和初始值执行函数操作 返回最终结果
 */
- (void)RACSignal_aggregate {
    
    RACSignal *signal = @[@1, @2, @3, @4].rac_sequence.signal;
    
    [[signal aggregateWithStart:@10 reduce:^id _Nonnull(NSNumber *running, NSNumber *next) {
        return @(running.integerValue + next.integerValue);
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];;
    
}



@end
