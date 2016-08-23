//
//  mineTableViewController.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/20.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFMineTableViewController.h"
#import "CustomeCell.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
@interface MFMineTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSArray * mineArr;
@end

@implementation MFMineTableViewController
-(NSArray *)mineArr{
    if (_mineArr==nil) {
        _mineArr=[NSArray arrayWithObjects:@"我的提醒",@"我赞过的",@"我的沙龙",@"我的缓存", nil];
    }return _mineArr;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kscreenWidth, 500) style:UITableViewStyleGrouped];
    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomeCell" bundle:nil]forCellReuseIdentifier:@"cell"];
    
    [self setupHeader];
    
}

-(void)setupHeader{
    UIView * headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, kscreenWidth, 70)];

    UIButton * likeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    likeButton.frame=CGRectMake(0, 0, (kscreenWidth * 0.5)-1, 50);
    [likeButton setTitle:@"想看" forState:UIControlStateNormal];
    [likeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    likeButton.backgroundColor=[UIColor whiteColor];
    [likeButton setImage:[UIImage imageNamed:@"0"] forState:UIControlStateNormal];

    UIButton * HaveseenButton=[UIButton buttonWithType:UIButtonTypeCustom];
    HaveseenButton.frame=CGRectMake((kscreenWidth * 0.5)+1, 0, (kscreenWidth * 0.5)-1, 50);
    HaveseenButton.backgroundColor=[UIColor whiteColor];
    [HaveseenButton setTitle:@"看过" forState:UIControlStateNormal];
    [HaveseenButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [headerView addSubview:likeButton];
    [headerView addSubview:HaveseenButton];
    [HaveseenButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    self.tableView.tableHeaderView=headerView;

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tablieweView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
         return 4;
    }else{
        return 1;
    }
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier =@"cell";
    CustomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[CustomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
        if (indexPath.section==0) {
            for (int i=0; i<4; i++) {
                NSString * str=[NSString stringWithFormat:@"a%ld",(long)indexPath.row];
                cell.imageView.image=[UIImage imageNamed:str];
                cell.textLabel.text=self.mineArr[indexPath.row];
            
            }
        }
            if (indexPath.section==1) {
                cell.textLabel.text=@"关注的影单";
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            }
            return cell;
        
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
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
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
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
