//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)


@interface VKPhotoManager : NSObject

/**
 *  相册权限判断
 *
 *  @return  YES 权限OK  NO 权限禁止
 */
- (BOOL)vk_AuthorizationStatusAuthorized;

/**
 *  相册权限检测  当权限OK 返回相册信息
 *
 *  result  YES 权限OK  NO 权限禁止
 *  alert 是否需要弹窗
 */
-(void)vk_RequestAuthorization:(void (^)(BOOL result, BOOL alert ,NSArray * allAlbum))authorizationCompletion;

/**
 *  获取所有相册信息
 */
- (void)vk_GetAllAlbum:(void (^)(NSArray * allAlbum))completion;


@end
