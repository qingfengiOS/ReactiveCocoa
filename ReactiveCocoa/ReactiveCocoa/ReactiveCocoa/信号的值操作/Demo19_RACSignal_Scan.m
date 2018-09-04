//
//  Demo19_RACSignal_Scan.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/4.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo19_RACSignal_Scan.h"
#import <ReactiveObjC.h>

@interface Demo19_RACSignal_Scan ()

@end

@implementation Demo19_RACSignal_Scan

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_Scan];
}

- (void)RACSignal_Scan {
    
    RACSignal *signal = @[@1, @2, @3, @5].rac_sequence.signal;
    RACSignal *signal2 = [signal scanWithStart:@0 reduce:^id _Nullable(NSNumber *running, NSNumber *next) {
        return @(running.integerValue + next.integerValue);
    }];
    
    [signal2 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@", x);
    }];
}

@end
