//
//  CustomTabBar.m
//  CustomTabBarController
//
//  Created by qianfeng on 15-8-19.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomButton.h"

@interface CustomTabBar()

/**
 *  记录当前选中的按钮
 */
@property (nonatomic, strong) CustomButton * selectedButton;

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
    }
    return self;
}

- (void)addTabBarButtonWithImageNormalName:(NSString *)normalName selectedName:(NSString *)selectedName andTitle:(NSString *)title{
    
    CustomButton * button = [CustomButton titleButton];
    
    //设置图片
    [button setImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.tag = self.subviews.count + 9;
    
    [self addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置选中第一个按钮
    self.subviews.count == 1 ? [self buttonClick:button]: nil;
}

/*
 *  按钮响应事件
 */
- (void)buttonClick:(CustomButton *)button{
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:(self.selectedButton.tag - 10) to:(button.tag - 10)];
    }
    
    //让当前选中按钮取消选中
    self.selectedButton.selected = NO;
    
    //让新按钮选中状态
    button.selected = YES;
    
    //新按钮成为选中按钮
    
    self.selectedButton = button;
}

/**
 *  布局button
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    for (int i = 0; i < count; i ++) {
        UIButton * button = self.subviews[i];
        
        //设置button的尺寸
        CGFloat W = self.frame.size.width / count;
        CGFloat H = self.frame.size.height;
        CGFloat X = W * i;
        CGFloat Y = 0;
        button.frame = CGRectMake(X, Y, W, H);
    }
}

@end
