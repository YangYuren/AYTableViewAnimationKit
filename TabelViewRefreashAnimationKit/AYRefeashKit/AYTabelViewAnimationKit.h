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
    AYTypeMoveLeftToRight = 0,//从左往右划出
    AYTypeMoveSpringLeftToRight = 0,//从左往右划出，带弹簧效果
    AYTypeTopToBottomAlpha,//从上往下渐渐显示
    AYTypeTopToBottomFall,//从上往下堆积显示
    AYTypeLeftAndRightShake,//左右交叉划出
    AYTypeOverTurn,//翻转显示
    AYTypeBottomToTop,//从下往上堆积显示
    AYTypeBottomToTopSpringList,//从下往上堆积显示，带弹簧效果
    AYTypeBottomToTopShrink,//从下往上滑动显示
    AYTypeTopToBottomShrink,//从上往下滑动显示
};

@interface AYTabelViewAnimationKit : NSObject<UICollisionBehaviorDelegate>

/**
    给一个tableview设置相应的动画
    @param animationType : 动画类型
 
 */
+ (void)showWithAnimationType:(AYTableViewAnimationType)animationType tableView:(UITableView *)tableView;

@end
