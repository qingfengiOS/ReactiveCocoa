//
//  01_RACSignal.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/29.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo_01_RACSignal.h"
#import <ReactiveObjC.h>

@interface Demo_01_RACSignal ()

@end


/**
 RACSignal:
 只是表示当数据改变时，信号内部会发出数据，他本身不具备发送信号的功能，而是交给内部一个订阅者去发出。默认一个信号都是冷信号，也就是值改变了也不触发，只有订阅了这个信号，这个信号才是热信号，值改变了才会触发
 */
@implementation Demo_01_RACSignal

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"RACSignal: 只是表示当数据改变时，信号内部会发出数据，他本身不具备发送信号的功能，而是交给内部一个订阅者去发出。默认一个信号都是冷信号，也就是值改变了也不触发，只有订阅了这个信号，这个信号才是热信号，值改变了才会触发");
    
    [self racUnitySignal];
    
    [self racDynamicSignal];
}

/**
 RAC单元信号
 */
- (void)racUnitySignal {
    
    RACSignal *signal1 = [RACSignal error:nil];
    RACSignal *signal2 = [RACSignal empty];
    RACSignal *signal3 = [RACSignal return:@"return value"];
    RACSignal *signal4 = [RACSignal new];
    
    NSLog(@"\nSignal1 = %@\nSignal2 = %@\nSignal3 = %@\nSignal4 = %@\n",signal1, signal2, signal3, signal4);
}


/**
 RAC动态信号
 */
- (void)racDynamicSignal {
    
    NSLog(@"1");
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
    
        NSLog(@"2");
        [subscriber sendNext:@"the value"];
        return [RACDisposable disposableWithBlock:^{
            //只要信号取消订阅就会来这里
            //默认一个信号发送完毕就会取消订阅。只要订阅者在，就不会主动取消订阅
            //清空资源
            NSLog(@"disposableWithBlock");
        }];
    }];
    NSLog(@"3");
    
    //处理数据，展示UI界面
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"4");
        
        NSLog(@"%@",x);//X 信号发送的内容
    }];
    
    NSLog(@"5");
    [disposable dispose];
    NSLog(@"6");
    
}

@end
