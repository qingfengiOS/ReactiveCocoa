//
//  Demo30_RACSignal_delay.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo30_RACSignal_delay.h"
#import <ReactiveObjC.h>

@interface Demo30_RACSignal_delay ()

@end

@implementation Demo30_RACSignal_delay

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_delay];
}

/**
 延迟操作
 */
- (void)RACSignal_delay {
    RACSignal *signal = @[@1,@2,@3].rac_sequence.signal;
    [[signal delay:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
}



@end
