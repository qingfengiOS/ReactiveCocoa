//
//  Person.h
//  ReactiveCocoa
//
//  Created by 情风 on 2018/10/7.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

+ (Person *)dicToModel:(NSDictionary *)dic;
@end
