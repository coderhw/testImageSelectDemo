//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKImagePickerDelegate.h"

@class ZCPhotoManager;

@interface VKImagePickerController : UINavigationController 

@property(nonatomic , weak) id <VKImagePickerDelegate> pickerDelegate;

/**
 *  nav bar  颜色设置
 */
@property(nonatomic, strong)UIColor *navigationBarColor;

/**
 *  筛选规则 暂时只支持图片格式(PNG,JPEG) ,图像长宽的筛选
 *
 *  @param predicate 筛选规则
 @  @param singleSelect 默认 NO 多选  YES 单选 
 *
 *  @return
 */
- (instancetype)initWithPredicate:(NSPredicate *)predicate singleSelect:(BOOL)singleSelect;

@end
