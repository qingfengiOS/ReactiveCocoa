//
//  Demo22_RACSignal_take.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo22_RACSignal_take.h"
#import <ReactiveObjC.h>

@interface Demo22_RACSignal_take ()

@end

@implementation Demo22_RACSignal_take

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_take];
}


/**
 指定拿前几次发送的数据
 */
- (void)RACSignal_take {
 
    RACSubject *subject = [RACSubject subject];
    
    //指定拿前几次发送的数据
    [[subject take:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"take x = %@", x);
    }];
    
    //指定拿最后几次发送的数据
    [[subject takeLast:3]subscribeNext:^(id  _Nullable x) {
        NSLog(@"takeLast x = %@", x);
    }];
    
    [subject sendNext:@"first"];
    [subject sendNext:@"second"];
    [subject sendNext:@"third"];
    [subject sendNext:@"fourth"];
    
    [subject sendCompleted];//从后往前拿一定要标记已经全部发送完毕了
}

/**
 结果：
 2018-09-04 14:23:59.728377+0800 ReactiveCocoa[31694:1022699] take x = first
 2018-09-04 14:23:59.728597+0800 ReactiveCocoa[31694:1022699] take x = second
 
 2018-09-04 14:23:59.728752+0800 ReactiveCocoa[31694:1022699] takeLast x = second
 2018-09-04 14:23:59.728831+0800 ReactiveCocoa[31694:1022699] takeLast x = third
 2018-09-04 14:23:59.728894+0800 ReactiveCocoa[31694:1022699] takeLast x = fourth
 */

@end
