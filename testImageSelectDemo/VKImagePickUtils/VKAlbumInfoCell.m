//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import "VKAlbumInfoCell.h"

@implementation VKAlbumInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.infoLabel];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.coverImageView.frame = CGRectMake(0, 0, self.contentView.bounds.size.height, self.contentView.bounds.size.height);
    self.infoLabel.frame = CGRectMake(self.contentView.bounds.size.height + 10, (self.contentView.bounds.size.height -24)*0.5, 150, 24);
}

-(UIImageView *)coverImageView
{
    if (!_coverImageView) {
        
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        tempImageView.contentMode = UIViewContentModeScaleToFill;
        
        _coverImageView = tempImageView;
    }
    return _coverImageView;
}

-(UILabel *)infoLabel
{
    if (!_infoLabel) {
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _infoLabel = tempLabel;
    }
    return _infoLabel;
}

@end
