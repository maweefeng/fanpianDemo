//
//  recommendController.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/20.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFRecommendController.h"
#import "CustomeCell.h"
#import "MFRecommendButton.h"
#import "MFDataTool.h"
#import "MFthreadarticle.h"
#import "MFthreadarticleCell.h"
#import "MFGalleryTableViewCell.h"
#import "MFDetailViewController.h"
#import "MFGalleryView.h"
#import "MFGelleryModel.h"
#import <MJRefresh.h>
#import "UIImageView+WebCache.h"
#import <SVProgressHUD.h>
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kbuttonWidth [UIScreen mainScreen].bounds.size.width * 0.25

@interface MFRecommendController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,assign)UIView * containView;
@property(nonatomic,assign)UIView * footView;
@property(nonatomic,assign)UIScrollView * headView;
@property(nonatomic,assign)UIPageControl * pageControl;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,copy)NSMutableArray * ArticleArr;
//画册
@property(nonatomic,copy)NSArray * imagelist;

@property(nonatomic,copy)NSMutableArray * thumbImage;

@property(nonatomic,weak)UICollectionView * imageCollectionView;

@end

@implementation MFRecommendController
//懒加载
-(NSMutableArray *)ArticleArr{
    if (_ArticleArr==nil) {
        NSMutableArray * arr=[NSMutableArray array];
        self.ArticleArr=arr;
    }
    return _ArticleArr;
    
    
}
-(NSArray *)imagelist{
    
    if (_imagelist==nil) {
        NSArray * arr=[NSArray array];
        self.imagelist=arr;
    }
    return _imagelist;
    
}
-(NSMutableArray *)thumbImage{
    if (_thumbImage==nil) {
        _thumbImage=[NSMutableArray array];
        
    }
    return _thumbImage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.tableView registerNib:[UINib nibWithNibName:@"MFthreadarticleCell" bundle:nil]forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MFGalleryTableViewCell" bundle:nil]forCellReuseIdentifier:@"MFGalleryTableViewCell"];
    
    [self setupHeaderView];
    [self setupButton];
    [self setupPageController];
    [self setupRefresh];
    
    
    //开启定时器
    NSTimer * timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startTimer:) userInfo:nil repeats:YES];
    self.timer=timer;
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
    self.tabBarController.tabBar.hidden=NO;
}
-(void)startTimer:(NSTimer *)timer
{
    static int i=0;
    if (i==2) {
        i=0;
    }else{
        i++;
    }
    //为页面翻转设置动画的效果
    [UIView animateWithDuration:1 animations:^{
        self.headView.contentOffset=CGPointMake(kscreenWidth*i, 0);
    }];
    
}
-(void)setupPageController{
    
    UIPageControl * pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 180, kscreenWidth, 20)];
    self.pageControl=pageControl;
    pageControl.numberOfPages=3;
    pageControl.currentPage=0;
    pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
    
    [self.containView addSubview:pageControl];
    
    
}
-(void)setupButton{
    NSArray * arr=[NSArray arrayWithObjects:@"上映",@"短片",@"影音",@"更多", nil];
    for (int i=0; i<4; i++) {
        MFRecommendButton * button=[MFRecommendButton buttonWithType:UIButtonTypeCustom];
        NSString * imageStr=[NSString stringWithFormat:@"%d",i];
        [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        //设置字体大小以及文字居中
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        //设置按钮的文字颜色
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //设置按钮的背景色
        button.backgroundColor=[UIColor whiteColor];
        //设置按钮的frame
        button.frame=CGRectMake(i*kbuttonWidth, 0, kbuttonWidth, 80);
        //把按钮加入到footView
        [self.footView addSubview:button];
    }
    
}
-(void)setupHeaderView{
    //创建scrollView
    UIView * containView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, kscreenWidth, 300)];
    self.containView=containView;
    //顶部滑动视图
    UIScrollView * headView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.headView=headView;
    //设置代理
    headView.delegate=self;
    
    headView.contentSize=CGSizeMake(375*3, 200);
    headView.pagingEnabled=YES;
    for (int i =0; i<3; i++) {
        NSString * str=[NSString stringWithFormat:@"watch%d",i];
        UIImageView * imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:str]];
        imgView.frame=CGRectMake(i*kscreenWidth, 0, kscreenWidth, 200);
        [headView addSubview:imgView];
        
    }
    //滑动视图下面的button 按钮视图
    UIView * footView=[[UIView alloc]initWithFrame:CGRectMake(0, 200, kscreenWidth, 80)];
    self.footView=footView;
    [containView addSubview:headView];
    [containView addSubview:footView];
    //设置轮播图片作为头部view
    self.tableView.tableHeaderView=containView;
    
    
}
-(void)setupRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
}
- (void)loadNewData {
    [SVProgressHUD show];
    [self fetchNewNormalNews];
    
    
}
-(void)fetchNewNormalNews{
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"data"]=@"data";
    [MFDataTool pictureWithParameters:(NSMutableDictionary *)parameters success:^(NSMutableArray *array) {
        //遍历数组
        for (NSDictionary * dic in array) {
            //取出数组中字典的类型
            NSString * type=dic[@"type"];
            if ([type isEqualToString:@"threadgallery"]) {
                //取出里面的图片数组
                self.imagelist=dic[@"itemdata"][@"imagelist"];
                for (NSDictionary * dict in self.imagelist) {
                    //取出每一个图片的url
                    NSString * obj=dict[@"thumb"];
                    [self.thumbImage addObject:obj];
                }
                
            }
        }
        self.ArticleArr=array;
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tablieweView numberOfRowsInSection:(NSInteger)section {
    
    return self.ArticleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier =@"cell";
    NSDictionary * dict=self.ArticleArr[indexPath.row];
    if ([dict[@"type"] isEqualToString:@"threadgallery"]) {
        
        MFGalleryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MFGalleryTableViewCell" forIndexPath:indexPath];
        cell.picArray=self.thumbImage;
        cell.Imagesubject=dict[@"itemdata"][@"subject"];
        cell.Imageintro=dict[@"itemdata"][@"intro"];
        return cell;
        
    }else {
        
        MFthreadarticleCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[MFthreadarticleCell alloc]init];
        }
        cell.MFType=dict[@"type"];
        cell.MFima=dict[@"itemdata"][@"image"];
        cell.MFLiketimes=dict[@"itemdata"][@"liketimes"];
        cell.MFReplies=dict[@"itemdata"][@"replies"];
        cell.MFIntro=dict[@"itemdata"][@"intro"];
        cell.MFSubject=dict[@"itemdata"][@"subject"];
        return cell;
        
    }
    
}
// 点击进行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MFDetailViewController * vc=[[MFDetailViewController alloc]init];
    
    vc.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    NSDictionary * dict=self.ArticleArr[indexPath.row];
    
    vc.title=dict[@"type"];
    
    NSString * urlStr=[NSString stringWithFormat:@"http://morguo.com/forum.php?mod=viewthread&tid=%@&mobile=2&webviewflag=1",dict[@"itemdata"][@"tid"]];
    
    NSURL * url=[NSURL URLWithString:urlStr];
    
    NSURLRequest * rqt=[NSURLRequest requestWithURL:url];
    
    UIWebView * detailWebView=[[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [detailWebView loadRequest:rqt];
    
    [vc.view addSubview:detailWebView];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger i =scrollView.contentOffset.x/kscreenWidth;
    self.pageControl.currentPage=i;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollVie{
    
    [self.timer setFireDate:[NSDate distantFuture]];
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    [self.timer setFireDate:[NSDate distantPast]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dict=self.ArticleArr[indexPath.row];
    NSString * type=dict[@"type"];
    if ([type isEqualToString:@"threadgallery"]){
        return 500;
    }
    return 350;
}



@end
