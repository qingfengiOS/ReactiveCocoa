//
//  Demo14_RACSignal_Bind.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo14_RACSignal_Bind.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface Demo14_RACSignal_Bind ()

@end

@implementation Demo14_RACSignal_Bind

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_Bind];
}

- (void)RACSignal_Bind {
    
    RACSubject *subject = [RACSubject subject];
    
    RACSignal *bindSignal = [subject bind:^RACSignalBindBlock _Nonnull{
        return ^RACSignal * (id value, BOOL *stop) {
            
            //可以对value二次处理，再转发。
            NSString *str = [NSString stringWithFormat:@"修改过原始数据 ： %@",value];
            return [RACReturnSignal return:str];
        };
    }];
    
    [bindSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
 
    [subject sendNext:@"发送数据"];
}


@end
