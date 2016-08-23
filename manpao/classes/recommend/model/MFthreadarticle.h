//
//  MFthreadarticle.h
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MFthreadarticle : NSObject
@property(nonatomic,copy)NSString * subject;
@property(nonatomic,copy)NSString * liketimes;
@property(nonatomic,copy)NSString * replies;
@property(nonatomic,copy)NSString * intro;
@property(nonatomic,copy)NSString * type;
@property(nonatomic,strong)UIImage * image;

@end
