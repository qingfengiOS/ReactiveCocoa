//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by 情风 on 2018/8/27.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;
@end

static NSString *const kCellIdentifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    self.dataArray = @[@"Demo_01_RACSignal",
                       @"Demo_02_RACSubscriber",
                       @"Demo03_rac_signalForSelector",
                       @"Demo04_rac_observeKeyPath",
                       @"Demo05_rac_signalForControlEvents",
                       @"Demo06_rac_addObserverForName",
                       @"Demo07_rac_textSignal",
                       @"Demo08_RACTuple",
                       @"Demo_09_RACSequence",
                       @"",
                       @"",
                       @"",
                       @"",
                       ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class class = NSClassFromString(self.dataArray[indexPath.row]);
    id viewController = [[class alloc]init];
    [viewController setValue:self.dataArray[indexPath.row] forKey:@"titleName"];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
