
//
//  Demo33_RACSignal_merge.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo33_RACSignal_merge.h"
#import <ReactiveObjC.h>
@interface Demo33_RACSignal_merge ()

@end

@implementation Demo33_RACSignal_merge

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_merge];
}


/// 信号合并
- (void)RACSignal_merge {
    
    //一个页面N个请求，拿到哪个数据显示哪个数据
    //subject发送数据的时候，是可以没有顺序的
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACSubject subject];
    RACSubject *subjectC = [RACSubject subject];
    
    //根据发送的情况处理
    RACSignal *mergeSignal = [RACSignal merge:@[subjectA,subjectB,subjectC]];
    [mergeSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [subjectB sendNext:@"data B"];
    [subjectA sendNext:@"data A"];
    [subjectC sendNext:@"data C"];
    
}


@end
