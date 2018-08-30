//
//  BaseViewController.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/29.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.titleName;
}

@end
