//
//  AYTabelViewAnimationKit.h
//  TabelViewRefreashAnimationKit
//
//  Created by shanbay410 on 2018/5/18.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//每一种动画对应的枚举
typedef NS_ENUM(NSInteger,AYTableViewAnimationType){
    AYTableViewAnimationTypeMove = 0,//从左往右划出
    AYTableViewAnimationTypeMoveSpring = 0,//从左往右划出，带弹簧效果
    AYTableViewAnimationTypeAlpha,//从上往下渐渐显示
    AYTableViewAnimationTypeFall,//从上往下堆积显示
    AYTableViewAnimationTypeShake,//左右交叉划出
    AYTableViewAnimationTypeOverTurn,//翻转显示
    AYTableViewAnimationTypeToTop,//从下往上堆积显示
    AYTableViewAnimationTypeSpringList,//从下往上堆积显示，带弹簧效果
    AYTableViewAnimationTypeShrinkToTop,//从下往上滑动显示
    AYTableViewAnimationTypeLayDown,//从上往下滑动显示
    AYTableViewAnimationTypeRote,//翻转显示
};

@interface AYTabelViewAnimationKit : NSObject<UICollisionBehaviorDelegate>

/**
    给一个tableview设置相应的动画
    @param animationType : 动画类型
 
 */
+ (void)showWithAnimationType:(AYTableViewAnimationType)animationType tableView:(UITableView *)tableView;

@end
