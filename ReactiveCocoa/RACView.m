//
//  RACView.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "RACView.h"

@implementation RACView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initBtn];
    }
    return self;
}


- (void)initBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.borderWidth = 0.5f;
    btn.frame = self.bounds;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

- (void)click:(UIButton *)sender {
    
    [self.clickSignal sendNext:sender];
}


- (RACSubject *)clickSignal {
    
    if (_clickSignal == nil) {
        _clickSignal = [[RACSubject alloc] init];
    }
    return _clickSignal;
}

@end
