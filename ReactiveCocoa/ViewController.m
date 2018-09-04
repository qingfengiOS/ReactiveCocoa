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
@property (nonatomic, copy) NSArray *sectionTitleArray;
@end

static NSString *const kCellIdentifier = @"cell";
static NSString *const kHeaderIdentifier = @"header";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:kHeaderIdentifier];
    
    NSArray *sectionOneArray = @[@"Demo_01_RACSignal",
                       @"Demo_02_RACSubject",
                       @"Demo03_rac_signalForSelector",
                       @"Demo04_rac_observeKeyPath",
                       @"Demo05_rac_signalForControlEvents",
                       @"Demo06_rac_addObserverForName",
                       @"Demo07_rac_textSignal",
                       @"Demo08_RACTuple",
                       @"Demo_09_RACSequence",
                       @"Demo10_RACSignal_interval_replace_timer",
                       @"Demo11_RACMulticastConnection",
                       @"Demo12_rac_liftSelector"];
    
    NSArray *sectionTwoArray = @[@"Demo13_RACCommand"];
    
    NSArray *sectionThreeArray = @[@"Demo14_RACSignal_Bind",
                                    @"Demo15_RACSignal_map",
                                    @"Demo16_RACSignal_flattenMap",
                                    @"Demo17_RACSignal_distinctUntilChanged",
                                    @"Demo18_RACSignal_ReduceEach",
                                    @"Demo19_RACSignal_Scan",
                                    @"Demo20_RAC_Macro"];
    
    NSArray *sectionFourArray = @[@"Demo21_RACSubject_filter",
                                  @"Demo22_RACSignal_take",
                                  @"Demo23_RACSignal_ignore",
                                  @"Demo24_RACSignal_skip",];
    
    self.dataArray = @[sectionOneArray,
                       sectionTwoArray,
                       sectionThreeArray,
                       sectionFourArray];
    
    self.sectionTitleArray = @[@"信号的基本操作",
                               @"RAC命令(RACCommand)",
                               @"信号的值操作",
                               @"信号的数量操作"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    NSArray *array = self.dataArray[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderIdentifier];
    header.textLabel.text = self.sectionTitleArray[section];
    header.textLabel.textColor = [UIColor blackColor];
    header.textLabel.font = [UIFont boldSystemFontOfSize:17];
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = self.dataArray[indexPath.section];
    Class class = NSClassFromString(array[indexPath.row]);
    id viewController = [[class alloc]init];
    [viewController setValue:array[indexPath.row] forKey:@"titleName"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

@end
