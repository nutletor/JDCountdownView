//
//  LoginViewController.m
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/12.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import "LoginViewController.h"

#import "FindPwdViewController.h"

@interface LoginViewController ()

- (IBAction)fogetPwdBtnAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)fogetPwdBtnAction:(id)sender {
    FindPwdViewController * findPwdVC = [[FindPwdViewController alloc] initWithNibName:@"FindPwdViewController" bundle:nil];
    [self.navigationController pushViewController:findPwdVC animated:YES];
}

@end
