//
//  Demo27_RACSignal_retry.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/6.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo27_RACSignal_retry.h"
#import <ReactiveObjC.h>

@interface Demo27_RACSignal_retry ()

@end

@implementation Demo27_RACSignal_retry

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_retry];
}


/**
 重试直到成功为止
 */
- (void)RACSignal_retry {
    
    __block int i = 0;
    RACSignal *singal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        if (i == 100) {
            [subscriber sendNext:@100];
        } else {
            NSLog(@"第%d次 接收到错误",i);
            [subscriber sendError:nil];
        }
        i++;
        return nil;
    }];
    
    RACSignal *signal2 = [singal retry];
    [signal2 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
}

@end
