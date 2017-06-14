//
//  MainViewController.m
//  Shuji
//
//  Created by sky on 2017/6/12.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 300, 40);
    [btn addTarget: self action: @selector(login) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    btn.backgroundColor = [UIColor redColor];
}

- (void)login
{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController: loginViewController animated: YES];
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
