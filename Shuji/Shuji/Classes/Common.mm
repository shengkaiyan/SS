//
//  Common.cpp
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "Common.h"
#import "AppDelegate.h"

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
         if (sharedInstance.reachabilityStatus <= AFNetworkReachabilityStatusNotReachable)
         {
         [appDelegate.common.updateUIViewController.model requestNetwork];
         }
         NSLog(@"AFNetworkReachabilityStatus Reachable");
         }
         
         sharedInstance.reachabilityStatus = status;
         
         }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    
    return sharedInstance;
}

@end
