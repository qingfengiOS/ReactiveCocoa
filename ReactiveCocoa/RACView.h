//
//  RACView.h
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/30.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACView : UIView
@property (nonatomic, strong) RACSubject *clickSignal;
@end

NS_ASSUME_NONNULL_END
