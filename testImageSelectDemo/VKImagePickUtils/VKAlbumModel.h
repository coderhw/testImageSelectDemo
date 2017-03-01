//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>


@interface VKAlbumModel : NSObject

/**
 *  相册名字
 */
@property(nonatomic, strong)NSString *albumName;
/**
 *  照片数量
 */
@property(nonatomic, assign)NSInteger count;
/**
 *  相册封面
 */
@property(nonatomic, strong)UIImage *coverImage;

/**
 *  图像资源
 */
@property(nonatomic, strong)NSArray *photos;

@end
