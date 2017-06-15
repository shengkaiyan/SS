//
//  MainViewController.m
//  Shuji
//
//  Created by sky on 2017/6/12.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()
{
    UIImageView *_smallImage;
    UIImageView *_bigImage;
}

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
    
    
    UIButton *btn2 = [UIButton buttonWithType: UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 200, 300, 40);
    [btn2 addTarget: self action: @selector(getProfile) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: btn2];
    btn2.backgroundColor = [UIColor redColor];
    
    _smallImage = [[UIImageView alloc] initWithFrame: CGRectMake(10, 300, 40, 40)];
    [self.view addSubview: _smallImage];
    
    _bigImage = [[UIImageView alloc] initWithFrame: CGRectMake(100, 300, 60, 60)];
    [self.view addSubview: _bigImage];
}

- (void)login
{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController: loginViewController animated: YES];
}

- (void)getProfile
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"hello" message: @"message" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    return;
    appDelegate.common.getImageViewController = self;
    [appDelegate.common toGetImage];
    //    [Common CommonInstance].getImage = ^(UIImage *image)
    //    {
    //        ivTemp.image = image;
    //        [Common CommonInstance].viewController = nil;
    //    };
    
    appDelegate.common.getTwoImage = ^(UIImage *image, UIImage *originalImage)
    {
        _smallImage.image = image;
        _bigImage.image = originalImage;
        [Common CommonInstance].getImageViewController = nil;
//
//        NSData *thumbImageData = UIImagePNGRepresentation(image);
//        
//        NSString *filePath = [NSString stringWithFormat: @"%@/%@/%@_%d/edit.jpg", DOCUMENTDIRECTORY, appDelegate.account.access_uid, room.Name, room.ID];
//        
//        BOOL write = [thumbImageData writeToFile:filePath atomically:NO];
//        
//        NSData *originalImageData = UIImagePNGRepresentation(originalImage);
        
//        NSString *filePathOriginalImage = [NSString stringWithFormat: @"%@/%@/%@_%d/original.jpg", DOCUMENTDIRECTORY, appDelegate.account.access_uid, room.Name, room.ID];
//        
//        BOOL write2 = [originalImageData writeToFile:filePathOriginalImage atomically:NO];
//        
//        if (write && write2) {
//            [aTableView reloadData];
//        }
    };
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
