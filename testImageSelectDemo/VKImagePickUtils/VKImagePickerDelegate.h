//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKImagePickerDelegate <NSObject>

- (void)vk_ImagePickerDidFinishPickingImage:(NSArray *)images;

@end
