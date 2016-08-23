//
//  TTTabBarController.m
//  TTNews
//
//  Created by 瑞文戴尔 on 16/3/25.
//  Copyright © 2016年 瑞文戴尔. All rights reserved.
//
#import "MFTabbarController.h"
#import "MFMineTableViewController.h"
#import "MFRecommendController.h"
#import "MFDiscoverTableViewController.h"
#import "MFSettingTableViewController.h"

@interface MFTabbarController ()


@end

@implementation MFTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MFRecommendController *vc1 = [[MFRecommendController alloc] init];
    [self addChildViewController:vc1 withImage:[UIImage imageNamed:@"space-rocket"] selectedImage:[UIImage imageNamed:@"space-rocket"] withTittle:@"推荐"];
    
    MFMineTableViewController *vc2 = [[MFMineTableViewController alloc] init];
    [self addChildViewController:vc2 withImage:[UIImage imageNamed:@"umbrella"] selectedImage:[UIImage imageNamed:@"umbrella"] withTittle:@"我的"];
    MFDiscoverTableViewController * vc3=[[MFDiscoverTableViewController alloc]init];
    [self addChildViewController:vc3 withImage:[UIImage imageNamed:@"traffic-light"] selectedImage:[UIImage imageNamed:@"traffic-light"] withTittle:@"发现"];
    MFSettingTableViewController * vc4=[[MFSettingTableViewController alloc]init];
    [self addChildViewController:vc4 withImage:[UIImage imageNamed:@"sunglasses"] selectedImage:[UIImage imageNamed:@"sunglasses"] withTittle:@"设置"];
 
}


- (void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectImage withTittle:(NSString *)tittle{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [nav.tabBarItem setImage:image];
    [nav.tabBarItem setSelectedImage:selectImage];
    nav.navigationBarHidden=YES;
    controller.title = tittle;
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:nav];
}


@end
