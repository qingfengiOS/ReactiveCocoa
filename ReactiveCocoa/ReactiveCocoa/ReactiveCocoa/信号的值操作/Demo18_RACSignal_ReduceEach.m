//
//  Demo18_RACSignal_ReduceEach.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo18_RACSignal_ReduceEach.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface Demo18_RACSignal_ReduceEach ()

@end

@implementation Demo18_RACSignal_ReduceEach

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self RACSignal_ReduceEach];
}


- (void)RACSignal_ReduceEach {

    RACTuple *tuple = RACTuplePack(@(1), @(2));
    
    RACSignal *signal = [RACReturnSignal return:tuple];
    
    RACSignal *signal2 = [signal reduceEach:^id _Nonnull(id value1, id value2){
        return [NSString stringWithFormat:@"%@-----%@",value1,value2];
    }];
    
    [signal2 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
    
}


@end
