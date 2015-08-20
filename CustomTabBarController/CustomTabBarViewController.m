//
//  CustomTabBarViewController.m
//  CustomTabBarController
//
//  Created by qianfeng on 15-8-19.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "CustomTabBar.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

#define barButtonCount 4

@interface CustomTabBarViewController ()<CustomTabBarDelegate>

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect tabBarframe = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    
    //添加自定义tabBar
    CustomTabBar * tabBar = [[CustomTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.frame = tabBarframe;
    tabBar.userInteractionEnabled = YES;
    [self.view addSubview:tabBar];
    
    ViewController1 * vc1 = [[ViewController1 alloc] init];
    vc1.view.backgroundColor = [UIColor yellowColor];
    ViewController2 * vc2 = [[ViewController2 alloc] init];
    vc2.view.backgroundColor = [UIColor greenColor];
    ViewController3 * vc3 = [[ViewController3 alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    ViewController4 * vc4 = [[ViewController4 alloc] init];
    vc4.view.backgroundColor = [UIColor redColor];
    
    self.viewControllers = @[vc1, vc2, vc3, vc4];
    
    //普通状态图片名
    NSArray * normalNames = @[@"tab_relation", @"tab_gift", @"tab_find", @"tab_mine_nor"];
    
    //选中状态图片名
    NSArray * selectedNames = @[@"tab_rela_hig", @"tab_gift_high", @"tab_find_hig", @"tab_mine_hig"];
    
    NSArray * titles = @[@"关系管理", @"情礼攻略", @"发现", @"我的"];
    //添加barButton
    for (int i = 0; i < barButtonCount; i ++) {
        [tabBar addTabBarButtonWithImageNormalName:normalNames[i] selectedName:selectedNames[i] andTitle:titles[i]];
    }
}

#pragma mark - CustomTabBarDelegate
- (void)tabBar:(CustomTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}

@end
