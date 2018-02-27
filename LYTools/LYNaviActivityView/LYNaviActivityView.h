//
//  NaviActivityView.h
//  BaseProduct
//
//  Created by Public on 16/11/3.
//  Copyright © 2016年 lalala. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYNaviActivityViewDelegate <NSObject>

-(void)naviActivityViewDelegateTitleBtnClick;

@end

@interface LYNaviActivityView : UIView
-(instancetype)initWithTitle:(NSString*)title;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *titleBtn;
@property(nonatomic,weak)id<LYNaviActivityViewDelegate>delegate;
-(void)startAnimation;
-(void)stopAnimation;
@end
