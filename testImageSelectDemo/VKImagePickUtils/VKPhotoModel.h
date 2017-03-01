//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZCImageType)
{
    ZCImageType_JPEG = 0,
    ZCImageType_PNG,
    ZCImageType_Unknown,
};

@interface VKPhotoModel : NSObject

@property(nonatomic, strong)UIImage *image;
@property(nonatomic, assign)CGFloat pixelWidth;
@property(nonatomic, assign)CGFloat pixelHeight;

/**
 *  图片格式  暂时只支持 PNG 和JPEG
 */
@property(nonatomic, assign)ZCImageType imageType;

@end
