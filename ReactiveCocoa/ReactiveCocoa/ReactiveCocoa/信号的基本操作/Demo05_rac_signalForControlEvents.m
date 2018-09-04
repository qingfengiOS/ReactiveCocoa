//
//  Demo05_rac_signalForControlEvents.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo05_rac_signalForControlEvents.h"
#import <ReactiveObjC.h>

@interface Demo05_rac_signalForControlEvents ()

@end

@implementation Demo05_rac_signalForControlEvents

- (void)viewDidLoad {
    [super viewDidLoad];

    [self rac_signalForControlEvents];
}

- (void)rac_signalForControlEvents {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {//这里的X就是对应的那个Button
        uint32_t num = arc4random_uniform(200) + 120;
        x.center = CGPointMake(num, num);
    }];
}

@end
