//
//  MFDiscoverButton.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFDiscoverButton.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kbuttonWidth [UIScreen mainScreen].bounds.size.width * 0.33
@implementation MFDiscoverButton

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return  CGRectMake(0, 50, kbuttonWidth, 20);
    
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, 10, kbuttonWidth, 32);
    
    
}

@end
