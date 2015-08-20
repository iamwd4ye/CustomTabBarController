//
//  CustomButton.m
//  CustomTabBarController
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "CustomButton.h"
#import "UIView+Extension.h"

#define IMAGE_WIDTH self.frame.size.height - 25
#define IMAGE_HEIGHT self.frame.size.height - 25
#define IMAGE_X (self.frame.size.width - self.frame.size.height + 25) / 2;
#define IMAGE_Y 5

@implementation CustomButton

+ (instancetype)titleButton{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内部图标居中
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 字体
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

/**
 *  设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = IMAGE_Y;
    CGFloat imageW = IMAGE_WIDTH;
    CGFloat imageH = IMAGE_HEIGHT;
    CGFloat imageX = IMAGE_X;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = IMAGE_HEIGHT + IMAGE_Y;
    CGFloat titleX = 0;
    CGFloat titleH = self.frame.size.height - titleY;
    CGFloat titleW = self.frame.size.width;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

/** 根据text, font 计算尺寸 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
/*
 *  重写setTitle方法，来根据title动态计算width
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];

    CGSize titleSize = [title sizeWithAttributes:@{@"sizeWithAttributes" : self.titleLabel.font}];
    
    self.width = titleSize.width + self.height + 10;
}

@end
