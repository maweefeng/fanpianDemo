//
//  MFDataTool.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFDataTool.h"
#import "MFthreadarticle.h"
#import <FMDB.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <SVProgressHUD.h>
@implementation MFDataTool
+(MFDataTool *)sharedTools{
    static MFDataTool * instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance=[[MFDataTool alloc]init];
    });

    return instance;
}

+(void)pictureWithParameters:(NSMutableDictionary *)pictureParameters success:(void (^)( NSMutableArray*array))success failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/plain" ,@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"data"] = @"data";
    [manager GET:@"http://morguo.com/forum.php?mod=movieexplorer&v=3&androidflag=1&appfrom=ios&iosversion=3.17&page=2&pdateline=1471774179" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSMutableArray *array=responseObject[@"data"][@"list"];
        success(array);
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}




@end
