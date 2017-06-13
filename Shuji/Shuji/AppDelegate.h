//
//  AppDelegate.h
//  Shuji
//
//  Created by sky on 2017/6/12.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "Common.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) Common *common;

extern AppDelegate *appDelegate;

@end

