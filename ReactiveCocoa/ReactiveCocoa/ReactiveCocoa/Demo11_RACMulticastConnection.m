//
//  Demo11_RACMulticastConnection.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/3.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo11_RACMulticastConnection.h"
#import <ReactiveObjC.h>

@interface Demo11_RACMulticastConnection ()

@end

@implementation Demo11_RACMulticastConnection

- (void)viewDidLoad {
    [super viewDidLoad];

    //   RACMulticastConnection 连接类。当一个信号被多次订阅的时候，避免多次调用创建信号中的block。
    //多次订阅了同一个信号。网络请求走了两次。
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        //发送网络请求
        NSLog(@"发送网络请求");
        
        //发送数据
        [subscriber sendNext:@"请求结果"];
        return nil;
    }];
    //不管订阅多少次信号，之请求一次数据。用RACMulticastConnection、必须通过信号创建。
    //将信号转成连接类
    RACMulticastConnection *connection = [signal publish];
    
    [connection.signal subscribeNext:^(id  _Nullable x) {
        //订阅信号
        NSLog(@"aaa : %@",x);
    }];
    
    [connection.signal subscribeNext:^(id  _Nullable x) {
        //订阅信号
        NSLog(@"bbb : %@",x);
    }];
    
    //连接
    [connection connect] ;  //信号只会被订阅一次。多次connect无效。
}


@end
