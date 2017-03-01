//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZCPhotoItemSelected)(NSInteger row);
typedef void(^ZCPhotoItemCancle)(NSInteger row);

@interface VKPhotoItem : UICollectionViewCell

@property(nonatomic, strong)UIImage *photo;
@property(nonatomic, assign)NSInteger row;
@property(nonatomic, copy)ZCPhotoItemSelected selectedBlock;
@property(nonatomic, copy)ZCPhotoItemCancle cancleBlock;

/**
 *  选择按钮是否隐藏
 */
@property(nonatomic, assign)BOOL hidden;

@end
