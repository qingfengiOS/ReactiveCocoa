//
//  Demo_43_bind.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/10/7.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo_43_bind.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"
#import "Person.h"

@interface Demo_43_bind ()

@end

@implementation Demo_43_bind

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rac_bind];
}

- (void)rac_bind {
    //创建源信号
    RACSubject *subject = [RACSubject subject];
    
    // 创建一个绑定信号
    RACSignal *bindSignal = [subject bind:^RACSignalBindBlock _Nonnull {
        return ^RACSignal *(id value, BOOL *stop) {
            //这里的Value就是源信号发送的数据，在这里可以对信号做进一步的包装处理（比如字典转模型）再发送出去
            Person *modelPerson = [Person dicToModel:value];//dic->Model
            return [RACReturnSignal return:modelPerson];
        };
    }];
    
    // 订阅绑定的信号
    [bindSignal subscribeNext:^(id  _Nullable x) {
        Person *p = (Person *)x;
        NSLog(@"绑定信号接收到的数据：p.name = %@, p.age = %ld",p.name,p.age);
    }];
    
    //源信号发送数据
    [subject sendNext:@{@"name": @"情风", @"age": @18}];
}


@end
