//
//  Demo_09_RACSequence.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo_09_RACSequence.h"
#import <ReactiveObjC.h>

@interface Model ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end

@implementation Model

+ (instancetype)modeWithDic:(NSDictionary *)dic {
    Model *model = [[Model alloc]init];
    model.name = dic[@"name"];
    model.age = [dic[@"age"] integerValue];
    return model;
}

@end



@interface Demo_09_RACSequence ()

@end

@implementation Demo_09_RACSequence

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACSequence];
    [self RACJosnToModel];
}


/**
 RACSequence用来代替原生的Array Dictionary 可快速遍历
 */
- (void)RACSequence {
    NSArray *array = @[@"1", @"2", @"3", @"4"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    
    
    NSDictionary *dic = @{@"key1": @"value1", @"key2": @"value2", @"key3" : @"value3"};
    [dic.rac_sequence.signal subscribeNext:^(RACTuple *x) {//这里的X就是tuple
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"key = %@, value = %@\n", key, value);
    }];
    
}

- (void)RACJosnToModel {
    
    NSArray *array = @[@{@"name":@"qing", @"age": @(18)},
                       @{@"name":@"feng", @"age": @(19)},];
    RACSequence *mapSequence = [array.rac_sequence map:^id _Nullable(NSDictionary *value) {
        return [Model modeWithDic:value];
    }];
    
    NSLog(@"%@", mapSequence);
    
    NSArray *resArray = mapSequence.array;
    NSLog(@"resArray = %@", resArray);
    
    
}


@end



