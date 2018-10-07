//
//  Person.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/10/7.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (Person *)dicToModel:(NSDictionary *)dic {
    Person *p = [Person new];
    p.name = dic[@"name"];
    p.age = [dic[@"age"] integerValue];
    return p;
}

@end
