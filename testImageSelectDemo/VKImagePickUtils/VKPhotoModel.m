//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import "VKPhotoModel.h"

@implementation VKPhotoModel


- (NSString *)description {
    return [NSString stringWithFormat:@"imageType:%ld image.size:%@",(long)_imageType,NSStringFromCGSize(_image.size)];
}
@end
