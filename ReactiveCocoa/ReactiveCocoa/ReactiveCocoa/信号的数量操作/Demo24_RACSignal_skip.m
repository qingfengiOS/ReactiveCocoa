//
//  Demo24_RACSignal_skip.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo24_RACSignal_skip.h"
#import <ReactiveObjC.h>

@interface Demo24_RACSignal_skip ()

@end

@implementation Demo24_RACSignal_skip

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RACSignal_skip];
}


/**
 skip 跳过前几个
 */
- (void)RACSignal_skip {
 
    RACSubject *subject = [RACSubject subject];
    
    //这里跳过3个信号 也就是说只能打印出第四个
    [[subject skip:3] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    [subject sendNext:@"3"];
    [subject sendNext:@"4"];
}
/**
 结果：
 2018-09-04 14:33:51.283405+0800 ReactiveCocoa[32715:1058183] x = 4
 */

@end
