//
//  NaviActivityView.m
//  BaseProduct
//
//  Created by Public on 16/11/3.
//  Copyright © 2016年 lalala. All rights reserved.
//

#import "LYNaviActivityView.h"

@interface LYNaviActivityView()
@property(nonatomic,strong)UIActivityIndicatorView *activity;
@property(nonatomic,strong)NSString *title;
@end

@implementation LYNaviActivityView

-(instancetype)initWithTitle:(NSString*)title{
    if (self = [super init]) {
        _title = title;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.userInteractionEnabled = YES;
    self.frame = CGRectMake(0, 0, 160, 44);
    UIFont *blodFont = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    self.titleLabel = [[UILabel alloc]init];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setFont:blodFont];//粗体
    self.titleLabel.frame = CGRectMake(10, 0, 140, 44);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = self.title;
    [self addSubview:self.titleLabel];
    
    CGSize textSize = [self sizeWithString:self.title Font:blodFont MaxSize:CGSizeMake(150, 44)];
    self.activity = [[UIActivityIndicatorView alloc]init];
    self.activity.center = CGPointMake((160-textSize.width)/2.0-16, 22);//22,22
    self.activity.hidden = YES;
    [self addSubview:self.activity];
    
    UIButton *titleBtn = [[UIButton alloc]init];
    titleBtn.frame = CGRectMake(0, 0, 160, 44);
    titleBtn.backgroundColor = [UIColor clearColor];
    [titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:titleBtn];
    self.titleBtn = titleBtn;
    
}

-(void)titleBtnClick{
    [self.delegate naviActivityViewDelegateTitleBtnClick];
}

-(void)startAnimation{    
    self.activity.hidden = NO;
    [self.activity startAnimating];
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:2.0];
}

-(void)stopAnimation{
    
    [self.activity stopAnimating];
    self.activity.hidden = YES;
    
}

//用对象的方法计算文本的大小
- (CGSize)sizeWithString:(NSString*)string Font:(UIFont*)font MaxSize:(CGSize)size {
    //特殊的格式要求都写在属性字典中
    NSDictionary*attrs =@{NSFontAttributeName: font};
    //返回一个矩形，大小等于文本绘制完占据的宽和高。
    return  [string  boundingRectWithSize:size  options:NSStringDrawingUsesLineFragmentOrigin  attributes:attrs   context:nil].size;
}

@end
