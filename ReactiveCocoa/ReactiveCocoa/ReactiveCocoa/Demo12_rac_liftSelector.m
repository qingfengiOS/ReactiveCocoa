//
//  Demo12_rac_liftSelector.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/3.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo12_rac_liftSelector.h"
#import <ReactiveObjC.h>

@interface Demo12_rac_liftSelector ()

@end

@implementation Demo12_rac_liftSelector

- (void)viewDidLoad {
    [super viewDidLoad];

    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"Request1");
        [subscriber sendNext:@"结果1"];
        return nil;
    }];
    
    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"Request2");
        [subscriber sendNext:@"结果2"];
        return nil;
    }];
    
    [self rac_liftSelector:@selector(upate:valueTwo:) withSignalsFromArray:@[signal1, signal2]];
    
}


/**
 拿到结果更新操作  这里的valueOne和valueTwo是对应请求的结果，且参数必须有（否则会崩溃）

 @param valueOne 结果1
 @param valueTwo 结果2
 */
- (void)upate:(id)valueOne valueTwo:(id)valueTwo {
    NSLog(@"valueOne = %@, valueTwo = %@",valueOne,valueTwo);
}

@end
