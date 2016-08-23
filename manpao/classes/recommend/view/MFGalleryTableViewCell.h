//
//  MFGalleryTableViewCell.h
//  manpao
//
//  Created by Weefeng Ma on 16/8/22.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MFGalleryView;
@interface MFGalleryTableViewCell : UITableViewCell
@property (strong, nonatomic)MFGalleryView * MFGalleryView;
@property (weak, nonatomic)  NSString *Imagesubject;
@property (weak, nonatomic)  NSString *Imageintro;
@property(weak,nonatomic)NSMutableArray * picArray;
@end
