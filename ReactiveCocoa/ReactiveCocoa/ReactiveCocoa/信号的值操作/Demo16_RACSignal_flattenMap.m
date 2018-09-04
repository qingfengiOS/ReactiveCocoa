//
//  Demo16_RACSignal_flattenMap.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo16_RACSignal_flattenMap.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface Demo16_RACSignal_flattenMap ()

@end

@implementation Demo16_RACSignal_flattenMap

- (void)viewDidLoad {
    [super viewDidLoad];

    [self racsignal_flattenMap];
//    [self racsignal_flattenMap2];
}


/**
 flattenMap 一般用于信号中的信号。
 信号发送信号。
 绑定信号的目的，是对信号做层处理，再传送出去。
 用来包装修改过的内容
 
 flattenMap内部也是bind
 */
- (void)racsignal_flattenMap {

    RACSubject *subject = [RACSubject subject];
    
    //通过flattenMap 把源信号转化为新信号
    RACSignal *signal = [subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
    
        value = [NSString stringWithFormat:@"原值为：%@，这里可以使用flattenMap修改，特别注意这里是对处理过后的信号（signal）订阅而不是源信号（subject）",value];
        return [RACReturnSignal return:value];
    }];
    
    
    //对处理过的信号，进行订阅；特别注意这里是多处理过后的信号（signal）订阅而不是源信号（subject）
    [signal subscribeNext:^(id  _Nullable x) {
       NSLog(@"### : %@",x); // ### : 处理：123
    }];
    
    [subject sendNext:@"源数据1"];//源信号发送
    
}



- (void)racsignal_flattenMap2 {
    
    RACSubject *subject = [RACSubject subject];
    
    RACSignal *signal = [subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
       
        NSLog(@"value = %@", value);  //valus is 123456
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"发送信号中的信号"];
            return nil;
        }];
    }];
    
    //对处理过的信号，进行订阅
    [signal subscribeNext:^(id  _Nullable signal_x) {
        NSLog(@"signal_x = %@",signal_x);
    }];
    
    [subject sendNext:@"123456"];
}



@end
