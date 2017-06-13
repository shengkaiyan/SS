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

@property(nonatomic, assign) AFNetworkReachabilityStatus reachabilityStatus;

@property(nonatomic, strong) NetViewController *updateUIViewController;

@property(nonatomic,copy) void(^getImage)(UIImage *);

@property(nonatomic,copy) void(^getTwoImage)(UIImage *, UIImage *);

+(Common *)CommonInstance;

@end
