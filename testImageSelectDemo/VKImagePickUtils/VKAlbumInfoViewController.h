//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKAlbumInfoViewController : UIViewController
@property(nonatomic, strong)NSArray *albums;
/**
 *  是否只能单选  默认 NO  可多选
 */
@property(nonatomic, assign)BOOL singleSelect;

-(void)reloadAlbums;
@end
