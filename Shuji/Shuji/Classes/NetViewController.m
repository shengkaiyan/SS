//
//  NetViewController.m
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "NetViewController.h"
#import "AppDelegate.h"

@interface NetViewController ()

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    appDelegate.common.updateUIViewController = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    appDelegate.common.updateUIViewController = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
