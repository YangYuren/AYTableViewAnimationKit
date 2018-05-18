//
//  UITableView+AYAnimationKit.m
//  TableViewAnimationKit-OC
//
//  Created by shanbay410 on 2018/5/17.
//  Copyright © 2018年 com.cn.fql. All rights reserved.
//

#import "UITableView+AYAnimationKit.h"
#import "AYTabelViewAnimationKit.h"

@implementation UITableView (AYAnimationKit)

- (void)ayShowAnimationWithType:(AYTableViewAnimationType)animationType{
    [AYTabelViewAnimationKit showWithAnimationType:animationType tableView:self];
}

@end
