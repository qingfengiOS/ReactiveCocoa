//
//  Demo15_RACSignal_map.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo15_RACSignal_map.h"
#import <ReactiveObjC.h>

@interface Demo15_RACSignal_map ()

@end

@implementation Demo15_RACSignal_map

- (void)viewDidLoad {
    [super viewDidLoad];

    [self racsignal_map];
}


/**
 转化
 */
- (void)racsignal_map {
    RACSubject *subject = [RACSubject subject];
    
    [[subject map:^id _Nullable(id  _Nullable value) {
        //直接返回的数据，就是需要处理的数据。
        return [NSString stringWithFormat:@"原值为：%@，这里可以修改",value];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
    [subject sendNext:@"源数据1"];
    [subject sendNext:@"源数据2"];
}

@end
