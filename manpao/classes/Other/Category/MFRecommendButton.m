//
//  MFButton.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFRecommendButton.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kbuttonWidth [UIScreen mainScreen].bounds.size.width * 0.25
@implementation MFRecommendButton



-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return  CGRectMake(0, 50, kbuttonWidth, 30);
    
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(30, 10, 32, 32);
}

@end
