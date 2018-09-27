//
//  Demo34_RACSignal_zip.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/9/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo34_RACSignal_zip.h"
#import <ReactiveObjC.h>
@interface Demo34_RACSignal_zip ()

@end

@implementation Demo34_RACSignal_zip

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSignal_zip];
}

- (void)RACSignal_zip {
    /**
     把两个信号压缩成一个信号。只有当两个信号同时发出信号内容，并且将内容合并成一个元祖返回
     一个发一个，是一组。
     */
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACSubject subject];
    
    //压缩
    RACSignal *zipSignal = [RACSignal zip:@[subjectA, subjectB]];
    
    [zipSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);//结果：A-B
    }];
    
    [subjectA sendNext:@"A1"];
    [subjectB sendNext:@"B1"];
    
    [subjectA sendNext:@"A2"];
    [subjectB sendNext:@"B2"];
    
    [subjectA sendNext:@"A3"];
    [subjectA sendNext:@"A4"];
    [subjectB sendNext:@"B3"];
    
    [subjectB sendNext:@"B4"];
    
    [subjectB sendNext:@"B5"];
    [subjectB sendNext:@"B6"];
    [subjectB sendNext:@"B7"];
    
    [subjectA sendNext:@"A5"];
    
}


@end
