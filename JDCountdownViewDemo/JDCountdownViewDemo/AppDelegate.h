//
//  AppDelegate.h
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/12.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//JDCountdownView
@property (nonatomic, strong) NSDate *refetchDate;//允许重发验证码的时间点

@end

