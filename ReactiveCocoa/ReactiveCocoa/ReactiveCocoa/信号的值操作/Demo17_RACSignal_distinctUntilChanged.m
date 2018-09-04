//
//  Demo17_RACSignal_distinctUntilChanged.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo17_RACSignal_distinctUntilChanged.h"
#import <ReactiveObjC.h>

@interface Demo17_RACSignal_distinctUntilChanged ()

@end

@implementation Demo17_RACSignal_distinctUntilChanged

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self RACSignal_distinctUntilChanged];
}

/**
 distinctUntilChanged 操作符将阻止 Observable 发出相同的元素。如果后一个元素和前一个元素是相同的，那么这个元素将不会被发出来。如果后一个元素和前一个元素不相同，那么这个元素才会被发出来。
 */
- (void)RACSignal_distinctUntilChanged {
    
    RACSubject *subject = [RACSubject subject];
    
    //忽略重复数据
    [[subject distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    
    [subject sendNext:@"A"];
    [subject sendNext:@"A"];
    [subject sendNext:@"A"];
    [subject sendNext:@"B"];
    [subject sendNext:@"B"];
    [subject sendNext:@"A"];
}

/*
 结果：
 2018-09-04 11:38:44.050996+0800 ReactiveCocoa[15750:567031] A
 2018-09-04 11:38:44.051472+0800 ReactiveCocoa[15750:567031] B
 2018-09-04 11:38:44.051607+0800 ReactiveCocoa[15750:567031] A
 */



@end
