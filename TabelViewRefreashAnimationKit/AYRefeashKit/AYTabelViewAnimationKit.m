//
//  AYTabelViewAnimationKit.m
//  TabelViewRefreashAnimationKit
//
//  Created by shanbay410 on 2018/5/18.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "AYTabelViewAnimationKit.h"
#import <objc/message.h>

#define KUIScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KUIScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation AYTabelViewAnimationKit

+ (void)showWithAnimationType:(AYTableViewAnimationType)animationType tableView:(UITableView *)tableView{
    //利用runtime获取方法列表来匹配具体调用哪个方法
    unsigned int methodCount = 0;
    Method * methodList = class_copyMethodList(object_getClass(self.class), &methodCount);
    //用来标记方法类型
    int methodTag = 0;
    for (int i = 0; i < methodCount; i++) {
        Method  method = methodList[i];
        SEL selector = method_getName(method);
        NSString * methodName = NSStringFromSelector(selector);
        if([methodName rangeOfString:@"AnimationWithTableView"].location != NSNotFound){
            if(methodTag == animationType){
                ((void (*)(id,SEL,UITableView *))objc_msgSend)(self,selector,tableView);
                break;
            }
            methodTag++;
        }
    }
    free(methodList);
}

#pragma mark - tableView相关动画对应的方法

+ (void)moveAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        CGFloat totalTime = 0.3;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-KUIScreenWidth, 0);
        [UIView animateWithDuration:0.25 delay:i*(totalTime/cells.count) options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)moveSpringAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        CGFloat totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-KUIScreenWidth, 0);
        [UIView animateWithDuration:0.4 delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)alphaAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.3 delay:i*0.05 options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)fallAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, - KUIScreenHeight);
        [UIView animateWithDuration:0.3 delay:(cells.count - i)*(totalTime/cells.count) options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}


+ (void)shakeAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        if (i%2 == 0) {
            cell.transform = CGAffineTransformMakeTranslation(-KUIScreenWidth,0);
        }else {
            cell.transform = CGAffineTransformMakeTranslation(KUIScreenWidth,0);
        }
        [UIView animateWithDuration:0.4 delay:i*0.03 usingSpringWithDamping:0.75 initialSpringVelocity:1/0.75 options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)overTurnAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.layer.opacity = 0.0;
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        NSTimeInterval totalTime = 0.7;
        [UIView animateWithDuration:0.3 delay:i*(totalTime/cells.count) options:0 animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

+ (void)toTopAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0,  KUIScreenHeight);
        [UIView animateWithDuration:0.35 delay:i*(totalTime/cells.count) options:UIViewAnimationOptionCurveEaseOut animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)springListAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.layer.opacity = 0.7;
        cell.layer.transform = CATransform3DMakeTranslation(0, -KUIScreenHeight, 20);
        NSTimeInterval totalTime = 1.0;
        [UIView animateWithDuration:0.4 delay:i*(totalTime/cells.count) usingSpringWithDamping:0.65 initialSpringVelocity:1/0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
        } completion:^(BOOL finished) {
            
        }];
    }
}

+ (void)shrinkToTopAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
        cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}

+ (void)layDownAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    NSMutableArray *rectArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y = i * 10;
        cell.frame = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i*5);
    }
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
        [UIView animateWithDuration:(totalTime/cells.count) * i animations:^{
            cell.frame = rect;
        } completion:^(BOOL finished) {
            cell.layer.transform = CATransform3DIdentity;
        }];
    }
}

@end
