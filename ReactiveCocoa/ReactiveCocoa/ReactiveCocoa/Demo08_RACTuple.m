//
//  Demo08_RaACTuple.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Demo08_RACTuple.h"
#import <ReactiveObjC.h>

@interface Demo08_RACTuple ()

@end

@implementation Demo08_RACTuple

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RACTuple];
}

- (void)RACTuple {
    RACTuple *tuple = [RACTuple tupleWithObjects:@"111",@(34),@"BBB", nil];
    NSLog(@"%@ %@ %@", tuple[0], tuple[1], tuple[2]);
    
    
    RACTuple *tuple2 = RACTuplePack(@"222",@(99), @"vvv");
    RACTupleUnpack(NSString *value1, NSNumber *value2, NSString *value3) = tuple2;
    NSLog(@"%@ %@ %@",value1, value2, value3);
}


@end
