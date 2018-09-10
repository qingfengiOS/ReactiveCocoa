//
//  Demo28_RACSignal_collect.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/10.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo28_RACSignal_collect.h"
#import <ReactiveObjC.h>

@interface Demo28_RACSignal_collect ()

@end

@implementation Demo28_RACSignal_collect

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_collect];
}


/**
 把本来单个发送的元素 包装为一个集合
 */
- (void)RACSignal_collect {
    RACSignal *signal = @[@1, @2, @3, @4].rac_sequence.signal;
    
    [[signal collect] subscribeNext:^(id  _Nullable x) {
        NSLog(@"collect x = %@", x);
    }];
    
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
}


@end
