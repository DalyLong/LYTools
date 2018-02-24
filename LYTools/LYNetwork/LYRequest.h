//
//  LYRequest.h
//  BaseProject
//
//  Created by Public on 2018/1/4.
//  Copyright © 2018年 Public. All rights reserved.
//

#import <Foundation/Foundation.h>

/**HTTP Request method*/
typedef NS_ENUM(NSInteger, LYRequestMethod) {
    LYRequestMethodGET = 0,
    LYRequestMethodPOST,
    LYRequestMethodHEAD,
    LYRequestMethodPUT,
    LYRequestMethodDELETE,
    LYRequestMethodPATCH,
};

@interface LYRequest : NSObject

/**Get请求(默认baseUrl)*/
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**Post请求(默认baseUrl)*/
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**Get请求无baseUrl*/
+ (void)getWithoutBaseUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**Post请求无baseUrl*/
+ (void)postWithoutBaseUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
