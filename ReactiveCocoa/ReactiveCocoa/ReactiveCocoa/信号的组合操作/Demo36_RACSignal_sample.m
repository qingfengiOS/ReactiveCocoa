//
//  Demo36_RACSignal_sample.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo36_RACSignal_sample.h"
#import <ReactiveObjC.h>

@interface Demo36_RACSignal_sample ()

@end

@implementation Demo36_RACSignal_sample

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_sample];
}

- (void)RACSignal_sample {
    
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    RACSignal *signal = [RACSignal
                           zip:@[ letters, [numbers sample:letters]]
                           reduce:^(NSString *letter, NSString *number) {
                               return [letter stringByAppendingString:number];
                           }];
    
    // Outputs: A1 B2 C3 D4
    [signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    // Outputs: A2 B3
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [numbers sendNext:@"2"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"3"];
    [letters sendNext:@"D"];
    [numbers sendNext:@"4"];
    [numbers sendNext:@"5"];
    [numbers sendNext:@"6"];
    /**
     | letter |    -  A  -  B  -  -  -  C  -  -  D
     | number |-  -  -  -  1  -  2   -  3  -  -  4
     | new  |     -  -  -  -  -  -  -  A2 -  -  B3 -
     -------------- time ----------------------->
     [numbers sample:letters]的意思是,只有当letters信号发出后,才需要获取number的最新值,取出letters还没有使用的最旧的信号,合并发出
     而当发出A,B时,number并没有值,所以无法合并发出,当发出C时,获得number的最新值2,取出还没有使用过的A值,合并发出A2.
     当发出D时,获取number的最新值3,与还没有使用过的B值,合并发出B3.
     而不断地发送number,是无法激活这个合并操作的.
     */
    

    
}




@end
