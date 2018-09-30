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
    RACSubject *letter = [RACSubject subject];
    RACSubject *number = [RACSubject subject];
    
    //压缩
    RACSignal *zipSignal = [RACSignal zip:@[letter, number]];
    
    [zipSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);//结果：A-B
    }];
    
    [letter sendNext:@"A"];
    [number sendNext:@"1"];
    
    [letter sendNext:@"B"];
    [number sendNext:@"2"];
    
    [letter sendNext:@"C"];
    [letter sendNext:@"D"];
    [number sendNext:@"3"];
    
    [number sendNext:@"4"];
    
    [number sendNext:@"5"];
    [number sendNext:@"6"];
    [number sendNext:@"7"];
    
    [letter sendNext:@"E"];
    /**
     | letter |-  A  -  B  -  -  -  -  -  -  C  - D
     | number |-  -  -  -  1  -  2  -  3  -   -  -   4
     | new  |-  -  -  -   - A1 -  B2 -  -  C3 -  -  D4
     -------------- time ----------------------->
     zip的合并行为是按顺序取出各个信号然后合并发出的.也就是说,
     letters的第一个值A和number的第一个值1合并输出A1,第二个值B和number的第二个值2合并输出B2
     假设D后面,还有E,F,G...,但是没有对应的number信号,zip的合并行为就无法进行下去了.
     */
}


@end
