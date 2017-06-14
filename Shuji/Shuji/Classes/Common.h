//
//  Common.hpp
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NetViewController.h"
#import "AFNetworking.h"

@interface Common : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    
}

//  网络状态
@property(nonatomic, assign) AFNetworkReachabilityStatus reachabilityStatus;

//  网络状态发生变化,保存需更新的界面
@property(nonatomic, strong) NetViewController *updateUIViewController;

//  拍照或选取照片
@property(nonatomic,copy) void(^getImage)(UIImage *);

@property(nonatomic,copy) void(^getTwoImage)(UIImage *, UIImage *);

@property(nonatomic, strong) UIViewController *getImageViewController;

- (void)toGetImage;

//  单例
+(Common *)CommonInstance;

@end
