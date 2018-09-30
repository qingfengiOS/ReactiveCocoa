//
//  Demo38_RACSignal_takeUntilReplacement.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo38_RACSignal_takeUntilReplacement.h"
#import <ReactiveObjC.h>
@interface Demo38_RACSignal_takeUntilReplacement ()

@end

@implementation Demo38_RACSignal_takeUntilReplacement

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RACSignal_takeUntilReplacement];
    
    
}

- (void)RACSignal_takeUntilReplacement {
    RACSubject *subject1 = [RACSubject subject];
    RACSubject *subject2 = [RACSubject subject];
    
    //subject1发送信号直到标记信号subject2结束
    [[subject1 takeUntilReplacement:subject2] subscribeNext:^(id  _Nullable x) {
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
