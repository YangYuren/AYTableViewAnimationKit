//
//  TestTableVC.m
//  TabelViewRefreashAnimationKit
//
//  Created by shanbay410 on 2018/5/18.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "TestTableVC.h"
#import "UITableView+AYAnimationKit.h"

@interface  TestTableVC()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TestTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    //分类实现tabelView动画
    [self.tableView ayShowAnimationWithType:self.index];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        CGFloat width = [[UIScreen mainScreen] bounds].size.width - 42;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(21, 10, width, 84)];
        view.backgroundColor = [UIColor colorWithRed:0.5 green:0.2 blue:0.5 alpha:1];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 10;
        
        UILabel * textlabel = [UILabel new];
        textlabel.text = self.typeStr;
        textlabel.frame = CGRectMake(0, 0, width, 84);
        
        [view addSubview:textlabel];
        
        
        [cell.contentView addSubview:view];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - lazy
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}
@end
