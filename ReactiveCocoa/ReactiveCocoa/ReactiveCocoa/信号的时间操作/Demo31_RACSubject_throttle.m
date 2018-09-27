//
//  Demo31_RACSubject_throttle.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo31_RACSubject_throttle.h"
#import <ReactiveObjC.h>
@interface Demo31_RACSubject_throttle ()

@end

@implementation Demo31_RACSubject_throttle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSubject_throttle];
}

/**
 throttle:
 n.    节流阀; 喉咙，气管; [机] 风门;
 vt.    扼杀，压制; 勒死，使窒息; 使节流; （用节汽阀等） 调节;
 vi.    节流，减速; 窒息;
 
 如果我们预先设置一个执行周期, 当第一次调用动作(滴水)和第二次调用动作之间的间隔大于执行周期, 则执行这个动作。反正, 不执行。
 */
- (void)RACSubject_throttle {

    RACSubject *subject = [RACSubject subject];
    [[subject throttle:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
    [subject sendNext:@1];
    [subject sendNext:@2];
    [subject sendNext:@3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [subject sendNext:@4];
        [subject sendNext:@5];
        
    });
    /*
     如果发送1，2秒内发送了2，那么1被抛弃了，如果2秒内，3又发送了，那么2就被抛弃了。那么保留了3.
 
     比如搜索操作，2秒内有新内容被搜索，那么前面的搜搜索就取消。
     */
}



@end
