//
//  ViewController.m
//  testImageSelectDemo
//
//  Created by Evan on 2017/3/1.
//  Copyright © 2017年 vanke. All rights reserved.
//

#import "ViewController.h"
#import "VKImagePickerController.h"

@interface ViewController ()<VKImagePickerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)go:(id)sender {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"imageType = %ld AND pixelWidth >= 3000",0];
    VKImagePickerController *picker =[[VKImagePickerController alloc] initWithPredicate:pre singleSelect:NO];
    picker.pickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)vk_ImagePickerDidFinishPickingImage:(NSArray *)images {
    self.imageView.image = [images firstObject];
}
@end
