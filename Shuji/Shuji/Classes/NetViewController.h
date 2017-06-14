//
//  NetViewController.h
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "BaseViewController.h"
#import "NetModel.h"

@interface NetViewController : BaseViewController

@property (strong, nonatomic) NetModel *model;

- (void)requestNetwork;

@end
