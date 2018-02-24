//
//  LYLoginStorage.m
//  BaseProject
//
//  Created by Public on 2018/1/9.
//  Copyright © 2018年 Public. All rights reserved.
//

#import "LYLoginStorage.h"

@implementation LYLoginStorage

+(LYLoginStorage *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LYLocalStorageConfig *config = [LYLocalStorageConfig sharedInstance];
        NSString *path = [NSString stringWithFormat:@"%@/loginStorage.archiver",config.basePath];
        sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    });
    return sharedInstance;
}

-(void)save{
    LYLocalStorageConfig *config = [LYLocalStorageConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@/loginStorage.archiver",config.basePath];
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}

-(void)clear{
    LYLocalStorageConfig *config = [LYLocalStorageConfig sharedInstance];
    NSString *path = [NSString stringWithFormat:@"%@/loginStorage.archiver",config.basePath];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.passWord forKey:@"passWord"];
    [aCoder encodeObject:self.headerImage forKey:@"headerImage"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.passWord = [aDecoder decodeObjectForKey:@"passWord"];
        self.headerImage = [aDecoder decodeObjectForKey:@"headerImage"];
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    LYLoginStorage *copy = [[[self class] allocWithZone:zone] init];
    copy.userName = [self.userName copyWithZone:zone];
    copy.passWord = [self.passWord copyWithZone:zone];
    copy.headerImage = self.headerImage;
    return copy;
}

@end
