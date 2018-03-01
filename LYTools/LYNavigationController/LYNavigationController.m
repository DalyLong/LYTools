//
//  LYNavigationController.m
//  YHCollaboration
//
//  Created by Public on 2018/3/1.
//  Copyright © 2018年 longyue. All rights reserved.
//

#import "LYNavigationController.h"

@interface LYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation LYNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        self.interactivePopGestureRecognizer.delegate = self;
    }
    return self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count>0) {
        // 自定义返回按钮
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        /*应用图片返回
        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
         */
        [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor colorWithRed:100/255.0 green:174/255.0 blue:235/255.0 alpha:1] forState:UIControlStateHighlighted];
        UIFont *blodFont = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        backButton.titleLabel.font = blodFont;
        
        [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:YES];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    return (self.childViewControllers.count>0);
}

- (void)back:(UIButton *)button {
    [super popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
