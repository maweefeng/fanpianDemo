//
//  MFthreadvideoCell.m
//  manpao
//
//  Created by Weefeng Ma on 16/8/21.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import "MFthreadarticleCell.h"
@interface MFthreadarticleCell()
//这是个坑 从自定义view里托戳来的imageview不能叫imageview
@property (weak, nonatomic) IBOutlet UIImageView * DetailView;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel * subject;
@property (weak, nonatomic) IBOutlet UILabel * intro;
@property (weak, nonatomic) IBOutlet UILabel * liketimes;
@property (weak, nonatomic) IBOutlet UILabel * replies;
- (IBAction)moreButton:(UIButton *)sender;

@end

@implementation MFthreadarticleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  
}
-(void)setMFima:(UIImage *)MFima{
    _MFima=MFima;
    self.DetailView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://morguo.com/%@",MFima]]]];
    self.DetailView.frame=CGRectMake(0, 0, 375, 200);

}
-(void)setMFSubject:(NSString *)MFSubject{
    _MFSubject=MFSubject;
    self.subject.text=MFSubject;
}
-(void)setMFType:(NSString *)MFType{
    _MFType=MFType;
    self.type.text=MFType;

}

-(void)setMFIntro:(NSString *)MFIntro{
    _MFIntro=MFIntro;

    self.intro.text=MFIntro;
}
-(void)setMFLiketimes:(NSString *)MFLiketimes{
    _MFLiketimes=MFLiketimes;
    self.liketimes.text=MFLiketimes;

}
-(void)setMFReplies:(NSString *)MFReplies{
    _MFReplies=MFReplies;
    self.replies.text=MFReplies;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)moreButton:(UIButton *)sender {
}
@end
