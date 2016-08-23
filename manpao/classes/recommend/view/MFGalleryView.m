//
//  MFGalleryView.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/22.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFGalleryView.h"
#import "MFGelleryModel.h"

@interface MFGalleryView()@end

@implementation MFGalleryView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collection"];

}
//-(void)setPicArr:(NSMutableArray *)picArr{
//    _picArr=picArr;
//    
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    if (self.picArr==nil) {
//        return 6;
//    }else{
//        return self.picArr.count;
//    }
//    NSLog(@"%ld",self.picArr.count);
//    
//}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UICollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
//    
//    cell.backgroundColor=[UIColor redColor];
////     UIImageView * imgView=[[UIImageView alloc]init];
////    imgView.frame=CGRectMake(0, 0, 100, 100);
////    cell.backgroundView=imgView;
////  
////    NSString * urlStr=[NSString stringWithFormat:@"http://morguo.com/%@",self.picArr[indexPath.item]];
////    NSLog(@"%@",self.picArr);
////    NSURL * url=[NSURL URLWithString:urlStr];
////    [imgView sd_setImageWithURL:url];
//    
//
//    
//    return cell;
//    
//}

@end
