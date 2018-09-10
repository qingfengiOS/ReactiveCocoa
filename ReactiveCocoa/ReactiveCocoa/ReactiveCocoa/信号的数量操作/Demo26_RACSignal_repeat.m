//
//  Demo26_RACSignal_repeat.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/6.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo26_RACSignal_repeat.h"
#import <ReactiveObjC.h>

@interface Demo26_RACSignal_repeat ()

@end

@implementation Demo26_RACSignal_repeat

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_repeat];

}


/**
 重复订阅信号 直到手动取消订阅为止
 */
- (void)RACSignal_repeat {
    
    RACSignal *signal = @[@1, @2, @3, @4].rac_sequence.signal;
    
    RACSignal *signal2 = [signal repeat];
    
    RACDisposable *disposeable = [signal2 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@", x);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [disposeable dispose];
        
    });
}

- (void)dealloc {
    NSLog(@"%@ dealloc resumed",NSStringFromClass([self class]));
}


@end
