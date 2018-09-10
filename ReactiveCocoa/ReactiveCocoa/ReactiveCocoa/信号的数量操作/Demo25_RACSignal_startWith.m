//
//  Demo25_RACSignal_startWith.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/6.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo25_RACSignal_startWith.h"
#import <ReactiveObjC.h>

@interface Demo25_RACSignal_startWith ()

@end

@implementation Demo25_RACSignal_startWith

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_startWith];
}


/**
 startWith在信号之前插入一个值
 */
- (void)RACSignal_startWith {
    
    RACSequence *sequence = @[@1, @2, @3,].rac_sequence;
    RACSignal *signal = sequence.signal;
    
    RACSignal *signal2 = [signal startWith:@"hello"];
    [signal2 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@", x);
    }];
}



@end
