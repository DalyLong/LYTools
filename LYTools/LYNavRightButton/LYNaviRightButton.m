//
//  LYNaviRightButton.m
//  BaseProject2
//
//  Created by Public on 2018/1/10.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYNaviRightButton.h"

@implementation LYNaviRightButton

+ (UIButton *)addRightItemWithTitle:(NSString *)title target:(UIViewController*)target action:(SEL)action enabled:(BOOL)enabled{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.userInteractionEnabled = enabled;
    [button setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:100.0/255 green:174.0/255 blue:235.0/255 alpha:1] forState:UIControlStateHighlighted];
    UIFont *blodFont = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    NSDictionary *attrs =@{NSFontAttributeName:blodFont};
    CGSize size = [title sizeWithAttributes:attrs];
    
    //! 这里需要根据内容大小来调整宽度
    button.frame = CGRectMake(0, 0, size.width <= 10 ? 70 : size.width + 10, 44);
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = blodFont;
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button setTitle:title forState:UIControlStateNormal];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-15时，间距正好调整
     *  为10；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    target.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
    return button;
}

+ (UIButton *)addRightItemWithImage:(UIImage *)image target:(UIViewController*)target action:(SEL)action enabled:(BOOL)enabled{
    
    UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [plusButton setImage:image forState:UIControlStateNormal];
    [plusButton setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    [plusButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *plusItem = [[UIBarButtonItem alloc] initWithCustomView:plusButton];
    [target.navigationItem setRightBarButtonItem:plusItem];
    
    return plusButton;
}

@end
