//
//  Demo40_RACSubject_switchToLatest.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo40_RACSubject_switchToLatest.h"
#import <ReactiveObjC.h>

@interface Demo40_RACSubject_switchToLatest ()

@end

@implementation Demo40_RACSubject_switchToLatest

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSubject_switchToLatest];
}

- (void)RACSubject_switchToLatest {
    //信号嵌套信号开始执行。先接受信号先拿到结果。把多维信号转为直线信号。
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACSubject subject];
    RACSubject *subjectC = [RACSubject subject];
    
    //switchToLatest 最新的信号。
    //发送信号A, C ， B   -->  B 是最新的信号。
    RACSubject *subject = [RACSubject subject];
    [subject.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"switchToLatest : %@",x);  //result is <456>
    }];
    
    [subject sendNext:subjectA];
    [subject sendNext:subjectC];
    [subject sendNext:subjectB];
    
    
    [subjectA sendNext:@123];
    [subjectB sendNext:@456];
    [subjectC sendNext:@789];
    
    
}



@end
