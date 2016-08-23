//
//  MFSettingTableViewController.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFSettingTableViewController.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width

@interface MFSettingTableViewController ()
@property(nonatomic,copy)NSDictionary * dic;
@end

@implementation MFSettingTableViewController
-(NSDictionary *)dic{
    if (_dic==nil) {
        _dic=@{
               @0:@[@"登录/注册"],
               @1:@[@"城市/北京市"],
               @2:@[@"邀请好友"],
               @3:@[@"关注微信公众号",@"加入翻片QQ群",@"意见反馈",@"清除缓存",@"关于我们",@"给我评分",],
               };
    }
    return _dic;



}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kscreenWidth, 500) style:UITableViewStyleGrouped];
    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomeCell" bundle:nil]forCellReuseIdentifier:@"setting"];

    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
        return 1;
    else if (section==1)
        return 1;
    
    else if (section==2)
        return 1;
    
    else
        return 6;
   
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier=@"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
     cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section==0) {
        cell.textLabel.text=self.dic[@0][0];
        cell.imageView.contentMode=UIViewContentModeScaleAspectFit;
        cell.imageView.layer.cornerRadius=16;
        
        cell.imageView.layer.masksToBounds=YES;
        cell.imageView.image=[UIImage imageNamed:@"support"];
        

    }else if (indexPath.section==1)
    {
        cell.textLabel.text=self.dic[@1][0];
    }else if (indexPath.section==2){
    cell.textLabel.text=self.dic[@2][0];
        
    }else{
    for (int i=0; i<6; i++) {
        cell.textLabel.text=self.dic[@3][indexPath.row];
        
    }
}
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
