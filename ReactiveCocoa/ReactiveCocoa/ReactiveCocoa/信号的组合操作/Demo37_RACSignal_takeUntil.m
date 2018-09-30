//
//  Demo37_RACSignal_takeUntil.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo37_RACSignal_takeUntil.h"
#import <ReactiveObjC.h>
@interface Demo37_RACSignal_takeUntil ()

@end

@implementation Demo37_RACSignal_takeUntil

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_takeUntil];
}

- (void)RACSignal_takeUntil {
    RACSubject *subject1 = [RACSubject subject];
    RACSubject *subject2 = [RACSubject subject];
    
    //subject1发送信号直到标记信号subject2结束
    [[subject1 takeUntil:subject2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@", x);
    }];
    
    [subject1 sendNext:@"1"];
    [subject1 sendNext:@"2"];
    [subject2 sendNext:@"A"];
    [subject2 sendCompleted];  //senderror 不行
    [subject1 sendNext:@"3"];
    [subject1 sendCompleted];
}



@end
