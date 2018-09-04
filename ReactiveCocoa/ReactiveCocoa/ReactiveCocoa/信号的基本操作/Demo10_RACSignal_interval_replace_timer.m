//
//  Demo10_RACSignal_interval_replace_timer.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/3.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo10_RACSignal_interval_replace_timer.h"
#import <ReactiveObjC.h>

@interface Demo10_RACSignal_interval_replace_timer ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) RACDisposable *disposable;
@end

@implementation Demo10_RACSignal_interval_replace_timer

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.bounds = CGRectMake(0, 0, 300, 50);
    self.btn.center = self.view.center;
    [self.btn setTitle:@"结束计时" forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btn];
    
    
    static int num = 0;
    self.disposable = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        num += 1;
        NSLog(@"%d --- %@", num, x);
        [self.btn setTitle:[NSString stringWithFormat:@"%d-%@",num, x] forState:UIControlStateNormal];
        
    }];
    
    
    @weakify(self)
    [[self.btn rac_signalForControlEvents:UIControlEventTouchDragInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self.disposable dispose];
        NSLog(@"计时结束");
    }];
    
    
}

- (void)dealloc {
    NSLog(@"%@ dealloc resumed",NSStringFromClass([self class]));
}


@end
