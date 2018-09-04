//
//  Demo13_RACCommand.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/3.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo13_RACCommand.h"
#import <ReactiveObjC.h>

@interface Demo13_RACCommand ()

@end

@implementation Demo13_RACCommand

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self RACCommand];
//    [self RACCommand_executionSignals];
    [self RACCommand_executing];
    
}


/**
 RACCommand双重命令
 */
- (void)RACCommand {
    
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@", input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            //发送数据
            [subscriber sendNext:@"执行完命令后产生的数据"];
            return nil;
        }];
    }];
    
    
    //执行命令
    RACSignal *signal = [command execute:@"来了"];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"收到的数据：%@", x);
    }];
}

- (void)RACCommand_executionSignals {
    
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
    
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            //发送数据
            [subscriber sendNext:@"执行完命令后产生的数据"];
            
            return nil;
        }];
    }];
    
    //command.executionSignals 信号源. 俗称：信号中的信号，发送信号的信号。
    [command.executionSignals subscribeNext:^(RACSignal  *x) {
        
        NSLog(@"executionSignals :%@",x);  //x is thie signal! <<RACDynamicSignal: 0x60c000030600> name:>
        
        [x subscribeNext:^(id  _Nullable x) {
            NSLog(@"executionSignals : %@",x);
        }];
        
    }];
    
    //switchToLatest 获取最新发送的信号
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"switchToLatest:%@",x);
    }];
    
    [command execute:@"输入命令"];
}

- (void)RACCommand_executing {

    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    activityView.center = self.view.center;
    activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:activityView];
    
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
           
            //发送数据
            [subscriber sendNext:@"执行完命令后产生的数据"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //发送完成.sendCompleted必须要写。
                [subscriber sendCompleted];
            });
            
            return nil;
        }];
    }];
    
    [command.executing subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"%@",x);
        
        if ([x boolValue]) {
            [activityView startAnimating];
        } else {
            NSLog(@"还没执行 | 执行结束了");
            [activityView stopAnimating];
        }
    }];
    
    RACSignal *signal = [command execute:@"执行"];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收到了数据： %@",x);
    }];

}

@end
