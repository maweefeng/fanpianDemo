//
//  MFGalleryTableViewCell.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/22.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFGalleryTableViewCell.h"
#import "MFGalleryView.h"
#import "UIImageView+WebCache.h"

@interface MFGalleryTableViewCell()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet MFGalleryView *GalleryView;
@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UILabel *intro;

@end

@implementation MFGalleryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UICollectionViewFlowLayout * layout = self.GalleryView.collectionViewLayout;
    
    
    CGFloat width=([UIScreen mainScreen].bounds.size.width - 4 * 10 )* 0.333;
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=10;
    layout.itemSize=CGSizeMake(width, width);
    self.GalleryView.dataSource=self;
    
    
}

-(void)setMFGalleryView:(MFGalleryView *)MFGalleryView{
    _MFGalleryView=MFGalleryView;
    self.GalleryView=MFGalleryView;

}
-(void)setImageintro:(NSString *)Imageintro{
    _Imageintro=Imageintro;
    self.intro.text=Imageintro;

}
-(void)setImagesubject:(NSString *)Imagesubject{
    _Imagesubject=Imagesubject;
    self.subject.text=Imagesubject;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.picArray.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    
         UIImageView * imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, 0, 100, 100);
        cell.backgroundView=imgView;
    
        NSString * urlStr=[NSString stringWithFormat:@"http://morguo.com/%@",self.picArray[indexPath.item]];
    
        NSURL * url=[NSURL URLWithString:urlStr];
        [imgView sd_setImageWithURL:url];
    return cell;
    
}



@end
