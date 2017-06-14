//
//  Common.cpp
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "Common.h"
#import "AppDelegate.h"

typedef NS_ENUM(NSInteger, ActionSheetTag) {
    ActionSheetTagSelectPicture        = 100,
};

typedef NS_ENUM(NSInteger, AlertViewTag) {
    AlertViewTagSelectPicture        = 100,
};


@implementation Common

+(Common *)CommonInstance {
    static Common *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[Common alloc] init];
        
        
        [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
         {
             if (status <= AFNetworkReachabilityStatusNotReachable) {
                 NSLog(@"AFNetworkReachabilityStatus NotReachable");
             }
             else
             {
                 NSLog(@"AFNetworkReachabilityStatus Reachable");
                 
                 if (sharedInstance.reachabilityStatus <= AFNetworkReachabilityStatusNotReachable)
                 {
                     [appDelegate.common.updateUIViewController requestNetwork];
//                     [appDelegate.common.updateUIViewController.model requestNetwork];
                 }
             }
             
             sharedInstance.reachabilityStatus = status;
         }];
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    
    return sharedInstance;
}


#pragma mark –
#pragma mark – UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage* originalImage = nil;
    originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (self.getImage) {
        if (editedImage) {
            self.getImage(editedImage);
        }
        else
        {
            self.getImage(originalImage);
        }
    }
    else if (self.getTwoImage)
    {
        self.getTwoImage(editedImage, originalImage);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark –
#pragma mark UIImagePickerControllerDelegate Cancel Methods

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)toCameraPickingController
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Error:没有照相设备");
    }
    else {
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.delegate = self;
        cameraPicker.allowsEditing = YES;
        cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraPicker.showsCameraControls = YES;
        
        [self.getImageViewController presentViewController: cameraPicker animated: YES completion:nil];
    }
}

- (void)toPhotoPickingController
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSLog(@"Error:无图片库");
    }
    else {
        UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
        photoPicker.delegate = self;
        photoPicker.allowsEditing = YES;
        photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self.getImageViewController presentViewController:photoPicker animated:YES completion:nil];
    }
}

#pragma mark – ++++++++++++++++++++
#pragma mark – actionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (ActionSheetTagSelectPicture == actionSheet.tag) {
        if (buttonIndex == 0) {
            [self toCameraPickingController];
        }
        else if (buttonIndex == 1) {
            [self toPhotoPickingController];
        }
    }
}

- (void)toGetImage
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"选取现有的照片", nil];
    actionSheet.tag = ActionSheetTagSelectPicture;
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView: self.getImageViewController.view];
}



@end
