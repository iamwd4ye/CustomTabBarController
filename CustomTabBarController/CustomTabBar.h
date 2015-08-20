//
//  CustomTabBar.h
//  CustomTabBarController
//
//  Created by qianfeng on 15-8-19.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;

@protocol CustomTabBarDelegate <NSObject>

@optional

/*
 *  代理方法，从一个button到另一个button
 */
- (void)tabBar:(CustomTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface CustomTabBar : UIView

@property (nonatomic, assign) id<CustomTabBarDelegate> delegate;

/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
- (void)addTabBarButtonWithImageNormalName:(NSString *)normalName selectedName:(NSString *)selectedName andTitle:(NSString *)title;

@end
