//
//  JDCountdownView.h
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/12.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDCountdownView;
@protocol JDCountdownViewDelegate <NSObject>

- (void)tapCountdownViewAction:(JDCountdownView *)countdownView;

@end

extern NSTimeInterval const CountdownSeconds;

@interface JDCountdownView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<JDCountdownViewDelegate>delegate;

@property (nonatomic, strong) UIColor * validTextColor;
@property (nonatomic, strong) UIColor * invalidTextColor;
@property (nonatomic, strong) UIColor * validBackdropColor;
@property (nonatomic, strong) UIColor * invalidBackdropColor;

- (void)startCountdown;
- (void)stopCountdown;
- (void)checkCountdownStatus;

@end
