//
//  MFDetailViewController.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/22.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFDetailViewController.h"

@interface MFDetailViewController ()

@end

@implementation MFDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      self.view.frame=[UIScreen mainScreen].bounds;
    self.navigationController.navigationBarHidden=NO;

    self.tabBarController.tabBar.hidden=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
