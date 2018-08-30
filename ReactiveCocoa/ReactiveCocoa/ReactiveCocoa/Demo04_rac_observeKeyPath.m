//
//  Demo04_rac_observeKeyPath.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo04_rac_observeKeyPath.h"
#import <ReactiveObjC.h>
#import "NSObject+RACKVOWrapper.h"

@interface Demo04_rac_observeKeyPath ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation Demo04_rac_observeKeyPath

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self rac_observeKeyPsth];
}

- (void)rac_observeKeyPsth {
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.bounds = CGRectMake(0, 0, 100, 50);
    self.button.center = self.view.center;
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {//这里的X就是对应的那个Button
        uint32_t num = arc4random_uniform(200) + 120;
        x.center = CGPointMake(num, num);
    }];

    //这里使用RAC的KVO监听frame属性
    [self.button rac_observeKeyPath:@"center" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        NSLog(@"valus ： %@ ， change ： %@",value,change);
    }];
    
}


/**
 默认的KVO需要在这里移除观察者 但是RAC已经处理 不需要手动移除
 */
- (void)dealloc {
    NSLog(@"%@ dealloc resumed",NSStringFromClass([self class]));
}
@end
