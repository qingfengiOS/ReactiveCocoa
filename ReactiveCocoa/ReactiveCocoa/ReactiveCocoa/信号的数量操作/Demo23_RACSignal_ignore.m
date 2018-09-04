//
//  Demo23_RACSignal_ignore.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo23_RACSignal_ignore.h"
#import <ReactiveObjC.h>

@interface Demo23_RACSignal_ignore ()

@end

@implementation Demo23_RACSignal_ignore

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_ignore];
}


/**
 忽略
 */
- (void)RACSignal_ignore {

    RACSubject *subject = [RACSubject subject];
    
//    RACSignal *ignoreSignal = [subject ignore:@"1"];//忽略1
    RACSignal *ignoreSignal = [[subject ignore:@"1"] ignore:@"2"];//忽略1和2
    
    //这里订阅的是忽略之后的信号：ignoreSignal
    [ignoreSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
    //信号发送由源信号（subject）发送
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    [subject sendNext:@"3"];
}


@end
