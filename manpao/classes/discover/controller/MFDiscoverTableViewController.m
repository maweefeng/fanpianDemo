//
//  MFDiscoverTableViewController.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFDiscoverTableViewController.h"
#import "MFDiscoverButton.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kbuttonWidth [UIScreen mainScreen].bounds.size.width * 0.33

@interface MFDiscoverTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSArray * discoverArr;
@end

@implementation MFDiscoverTableViewController
-(NSArray *)discoverArr{
    if (_discoverArr==nil) {
        _discoverArr=[NSArray arrayWithObjects:@"影评",@"画报",@"杂粮",@"经典台词", nil];
    }
    return _discoverArr;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.tableView registerNib:[UINib nibWithNibName:@"MFDiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:@"discover"];
    [self setupHeadView];
    
}

-(void)setupHeadView{
    UIView * headView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, kscreenWidth, 180)];
//    headView.backgroundColor=[UIColor redColor];
    NSArray * arr=[NSArray arrayWithObjects:@"上映",@"短片",@"影音",@"沙龙",@"影酷",@"电影原声", nil];
    //确定列数
    int column=3;
    //确定总数
    int count=6;
    //计算间距
     CGFloat margin = (kscreenWidth - column * kbuttonWidth) / (column + 1);
    for (int i=0; i<count; i++) {
        //得到列索引和行索引
        NSInteger rowIndex=i/column;
        NSInteger columnIndex=i%column;
        CGFloat buttonX=kbuttonWidth*columnIndex + (columnIndex + 1) * margin;
        CGFloat buttonY=kbuttonWidth * rowIndex *0.7 + rowIndex * margin ;
        MFDiscoverButton * button=[MFDiscoverButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(buttonX, buttonY, kbuttonWidth, kbuttonWidth * 0.7-1);
        button.backgroundColor=[UIColor whiteColor];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSString * imageStr=[NSString stringWithFormat:@"%d",i];
        [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        //设置图片居中显示 不会过多的拉伸
        button.imageView.contentMode=UIViewContentModeCenter;
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [headView addSubview:button];
        
    }
    self.tableView.tableHeaderView=headView;
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier=@"discover";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    for (int i=0; i<4; i++) {
        NSString * str=[NSString stringWithFormat:@"a%ld",(long)indexPath.row];
        cell.imageView.image=[UIImage imageNamed:str];
        cell.textLabel.text=self.discoverArr[indexPath.row];
    }
     return cell;
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
