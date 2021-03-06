//
//  VKMissionSearchViewController.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/26.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import "VKPhotosViewController.h"
#import "VKPhotoItem.h"
#import "VKPhotoModel.h"
@interface VKPhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *imageCollectionView;
@property(nonatomic, strong)UIView *bottomContainer;
@property(nonatomic, strong)NSMutableArray *photoModels;

@end

@implementation VKPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self loadContentViews];
    
}

#pragma mark -- life cycle
-(void)loadContentViews {
    
    self.navigationItem.title = @"相机胶卷";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"取消"
                                              style:UIBarButtonItemStylePlain
                                              target:self action:@selector(cancelDone)];
    [self.view addSubview:self.imageCollectionView];
    [self.imageCollectionView registerClass:[VKPhotoItem class] forCellWithReuseIdentifier:@"photoCell"];
    if (!self.singleSelect) {
        [self stepBottomContainer];
        self.photoModels = [[NSMutableArray alloc] init];
    }
}

-(void)reloadPhotos {
    [self.imageCollectionView reloadData];
}

#pragma mark -- collection dataSource delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.albumModel.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"photoCell";
    VKPhotoItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    VKPhotoModel *pm = self.albumModel.photos[indexPath.row];
    cell.photo = pm.image;
    if (self.singleSelect) {
        cell.hidden = YES;
    }else{
        cell.hidden = NO;
    }
    __weak typeof(self) WEAKSELF = self;
    if (!self.singleSelect) {
        cell.selectedBlock = ^(NSInteger row){
            VKPhotoModel *pms = WEAKSELF.albumModel.photos[indexPath.row];
            [WEAKSELF.photoModels addObject:pms];
        };
        cell.cancleBlock = ^(NSInteger row){
            VKPhotoModel *pmc = WEAKSELF.albumModel.photos[indexPath.row];
            [WEAKSELF.photoModels removeObject:pmc];
        };
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
    if (self.singleSelect) {
        VKPhotoModel *pm = self.albumModel.photos[indexPath.row];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"zcImagePickerFinish" object:@[pm.image]];
        [self cancelDone];
    }
}

#pragma mark -- private method
-(void)cancelDone {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)finishDone {
    NSLog(@"__photoModels :%@",self.photoModels);
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [self.photoModels enumerateObjectsUsingBlock:^(VKPhotoModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [photos addObject:obj.image];
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zcImagePickerFinish" object:photos];
    [self cancelDone];
}

#pragma mark -- views init
-(UICollectionView *)imageCollectionView {
    
    if (!_imageCollectionView) {
        
        CGFloat width = [[UIScreen mainScreen] bounds].size.width;
        UICollectionViewFlowLayout *imageLayout = [[UICollectionViewFlowLayout alloc] init];
        imageLayout.itemSize = CGSizeMake((width-20)/4.0, (width-20)/4.0);
        imageLayout.minimumLineSpacing = 4;
        imageLayout.minimumInteritemSpacing = 4;
        imageLayout.sectionInset = UIEdgeInsetsMake(4, 4, 0, 4);
        
        CGRect frame;
        if (self.singleSelect) {
            frame = self.view.bounds;
        }else{
            frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - 48);
        }
        UICollectionView *tempCollection = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:imageLayout];
        tempCollection.dataSource = self;
        tempCollection.delegate = self;
        tempCollection.backgroundColor = [UIColor whiteColor];
        _imageCollectionView = tempCollection;
    }
    return _imageCollectionView;
}

-(void)stepBottomContainer {
    
    self.bottomContainer =[[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 48, self.view.bounds.size.width, 48)];
    self.bottomContainer.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.bottomContainer];
    UIButton *finishBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-110, 0, 110, 48)];
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setBackgroundColor:[UIColor blackColor]];
    [finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishDone) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomContainer addSubview:finishBtn];
}
@end
