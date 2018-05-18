//
//  ViewController.m
//  TabelViewRefreashAnimationKit
//
//  Created by shanbay410 on 2018/5/18.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "ViewController.h"
#import "TestTableVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TabelView动画测试";
    _titles = @[
                @"AYTableViewAnimationTypeMove",
                @"AYTableViewAnimationTypeMoveSpring",
                @"AYTableViewAnimationTypeAlpha",
                @"AYTableViewAnimationTypeFall",
                @"AYTableViewAnimationTypeShake",
                @"AYTableViewAnimationTypeOverTurn",
                @"AYTableViewAnimationTypeToTop",
                @"AYTableViewAnimationTypeSpringList",
                @"AYTableViewAnimationTypeShrinkToTop",
                @"AYTableViewAnimationTypeLayDown"
                ];
    
    [self.view addSubview:self.tableView];
}

#pragma mark  - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TestTableVC *vc = [[TestTableVC alloc] init];
    vc.index = indexPath.row;
    vc.typeStr = _titles[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (self.titles.count > indexPath.row) {
        cell.textLabel.text = self.titles[indexPath.row];
    }
    return cell;
}

#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end

