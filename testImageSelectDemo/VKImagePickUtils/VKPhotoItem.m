//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import "VKPhotoItem.h"

@interface VKPhotoItem ()

@property(nonatomic, strong)UIImageView *photoView;

@property(nonatomic, strong)UIButton *photoSelectBtn;
@property(nonatomic, assign)BOOL zcSelected;

@end

@implementation VKPhotoItem


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.photoSelectBtn.frame = CGRectMake(self.bounds.size.width - 29, 5, 24, 24);
}

-(void)selectDone
{
    self.zcSelected = !self.zcSelected;
    
    [self.photoSelectBtn setImage:(self.zcSelected ?[UIImage imageNamed:@"sel_picker"] : [UIImage imageNamed:@"def_picker"]) forState:UIControlStateNormal];
    
    if (self.zcSelected) {
        
        if (self.selectedBlock) {
            
            self.selectedBlock(self.row);
        }
    }
    else
    {
        if (self.cancleBlock) {
            self.cancleBlock(self.row);
        }
    }
    
}

-(void)setPhoto:(UIImage *)photo
{
    if (_photo != photo) {
        _photo = photo;
        
        self.photoView.image = _photo;
    }
}

-(void)setHidden:(BOOL)hidden
{
    self.photoSelectBtn.hidden = hidden;
}

#pragma mark -- views init
-(UIImageView *)photoView
{
    if (!_photoView) {
        
        UIImageView *tempPhoto =[[UIImageView alloc] initWithFrame:self.bounds];
        tempPhoto.contentMode = UIViewContentModeScaleToFill;
        
        _photoView = tempPhoto;
        
        [self addSubview:_photoView];
    }
    return _photoView;
}

-(UIButton *)photoSelectBtn
{
    if (!_photoSelectBtn) {
        
        UIButton *tempBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [tempBtn setImage:[UIImage imageNamed:@"def_picker"] forState:UIControlStateNormal];
        [tempBtn addTarget:self action:@selector(selectDone) forControlEvents:UIControlEventTouchUpInside];
        tempBtn.hidden = YES;
        
        _photoSelectBtn = tempBtn;
        
        [self addSubview:_photoSelectBtn];
    }
    
    return _photoSelectBtn;
}



@end
