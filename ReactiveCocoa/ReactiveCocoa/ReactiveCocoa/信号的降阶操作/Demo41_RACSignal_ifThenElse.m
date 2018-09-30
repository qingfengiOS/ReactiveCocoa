//
//  Demo41_RACSignal_ifThenElse.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo41_RACSignal_ifThenElse.h"
#import <ReactiveObjC.h>

@interface Demo41_RACSignal_ifThenElse ()

@end

@implementation Demo41_RACSignal_ifThenElse

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self RACSignal_ifThenElse];
}

- (void)RACSignal_ifThenElse {
    
    RACSignal *signalA = @[@1,@2,@3].rac_sequence.signal;
    RACSignal *signalB = @[@"A",@"B",@"C"].rac_sequence.signal;
    
    //选择发送的信号
    RACSubject *subject = [RACSubject subject];
    [[RACSignal if:subject then:signalA else:signalB] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
    [subject sendNext:@1];//选择发送if分支的信号（signalA)
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [subject sendNext:@0];//选择发送else分支的信号 (signalB)
    });
}

@end
