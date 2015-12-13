//
//  SetNewPwdViewController.m
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/12.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import "SetNewPwdViewController.h"

#import "JDCountdownView.h"

@interface SetNewPwdViewController ()<JDCountdownViewDelegate>

@property (weak, nonatomic) IBOutlet JDCountdownView *countdownView;

- (IBAction)backBtnAction:(id)sender;

@end

@implementation SetNewPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.countdownView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.countdownView checkCountdownStatus];
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

- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - JDCountdownView Delegate
- (void)tapCountdownViewAction:(JDCountdownView *)countdownView
{
    //to do 发送验证码
    [self.countdownView startCountdown];//开始重发验证码倒计时
    
    if (/**/(1)) {  //验证码发送成功
        
    } else {        //验证码发送失败
        [self.countdownView stopCountdown];
    }
}

@end
