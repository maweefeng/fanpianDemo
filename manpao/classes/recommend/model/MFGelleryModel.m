//
//  MFGelleryModel.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/23.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFGelleryModel.h"
#import <MJExtension.h>
@implementation MFGelleryModel



-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self= [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [self mj_encode:aCoder];
}

@end
