//
//  LoginViewController.m
//  Shuji
//
//  Created by sky on 2017/6/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"

@interface LoginViewController ()
{
    LoginModel *_logingModel;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *lb = [[UILabel alloc] initWithFrame: CGRectMake(0, 100, 300, 40)];
    lb.text = NSLocalizedString(@"hello", @"world");
    [self.view addSubview: lb];
    
    self.view.backgroundColor = [UIColor redColor];
    
    _logingModel = [[LoginModel alloc] init];
    self.model = _logingModel;
}

- (void)requestNetwork
{
    [_logingModel login];
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
