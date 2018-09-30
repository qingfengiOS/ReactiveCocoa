//
//  Demo42_RACSignal_flatten.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo42_RACSignal_flatten.h"
#import <ReactiveObjC.h>

@interface Demo42_RACSignal_flatten ()

@end

@implementation Demo42_RACSignal_flatten

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_flatten];
}

- (void)RACSignal_flatten {

    RACSignal *signal = @[@1, @2, @3, @4, @5, @6].rac_sequence.signal;
    
    RACSignal *signalGroup = [signal groupBy:^NSString *(NSNumber *object) {
        return object.integerValue % 2 == 0 ? @"odd" : @"even";
    }];
    
    [[[signalGroup take:6]flatten] subscribeNext:^(id  _Nullable x) {
        NSLog(@"next: %@", x);
    }];
}

@end
