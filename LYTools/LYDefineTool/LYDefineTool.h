//
//  LYTools.h
//  BaseProject2
//
//  Created by Public on 2018/1/10.
//  Copyright © 2018年 Public. All rights reserved.
//

#ifndef LYDefineTool_h
#define LYDefineTool_h

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define WeakSelf(weakSelf) __weak __typeof__(&*self) weakSelf = self

#ifdef DEBUG // 处于开发阶段
#define LYLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define LYLog(...)
#endif

#endif /* LYDefineTool_h */
