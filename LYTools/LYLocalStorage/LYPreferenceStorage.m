//
//  LYPreferenceStorage.m
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYPreferenceStorage.h"

@implementation LYPreferenceStorage

#define IsFirstAction @"isFirstAction"
#define IsFirstLogin @"isFirstLogin"

+(LYPreferenceStorage *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) {
        ///初始化一些数据
        if ([[NSUserDefaults standardUserDefaults] objectForKey:IsFirstAction] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:IsFirstAction];
        }
        if ([[NSUserDefaults standardUserDefaults] objectForKey:IsFirstLogin] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:IsFirstLogin];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return self;
}

-(void)setIsFirstAction:(NSString *)isFirstAction{
    if (isFirstAction) {
        [[NSUserDefaults standardUserDefaults] setObject:isFirstAction forKey:IsFirstAction];
    }
}

-(NSString *)isFirstAction{
    return [[NSUserDefaults standardUserDefaults] objectForKey:IsFirstAction];
}

-(void)setIsFirstLogin:(NSString *)isFirstLogin{
    if (isFirstLogin) {
        [[NSUserDefaults standardUserDefaults] setObject:isFirstLogin forKey:IsFirstLogin];
    }
}

-(NSString *)isFirstLogin{
    return [[NSUserDefaults standardUserDefaults] objectForKey:IsFirstLogin];
}

-(void)clear{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:IsFirstLogin];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:IsFirstAction];
}

@end
