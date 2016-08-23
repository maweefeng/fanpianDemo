//
//  MFDataTool.h
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MFDataTool : NSObject
+(MFDataTool *)sharedTools;
+(void)pictureWithParameters:(NSMutableDictionary *)pictureParameters success:(void (^)(NSMutableArray *array))success failure:(void (^)(NSError *error))failure;

@end
