//
//  JDCountdownView.m
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/12.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import "JDCountdownView.h"
#import "JDCountdownSource.h"

@interface JDCountdownView ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;

@property (nonatomic, strong) NSTimer * countdownTimer;
@property (nonatomic, assign) NSInteger leftSeconds;

- (IBAction)tapGestureAction:(id)sender;

@end

NSTimeInterval const CountdownSeconds = 10;//设置倒计时秒数

@implementation JDCountdownView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.view.frame = self.bounds;
    
    self.layer.cornerRadius = 2;
    self.layer.masksToBounds = YES;

    self.validTextColor = [UIColor whiteColor];
    self.invalidTextColor = [UIColor whiteColor];
    self.validBackdropColor = [UIColor orangeColor];
    self.invalidBackdropColor = [UIColor grayColor];
}

- (IBAction)tapGestureAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(tapCountdownViewAction:)]) {
        [self.delegate tapCountdownViewAction:self];
    }
}

- (void)startCountdown
{
    [JDCountdownSource sharedCountdownSource].refetchDate = [NSDate dateWithTimeIntervalSinceNow:CountdownSeconds];
    _leftSeconds = CountdownSeconds;
    
    [self startCountdownTimer];
}

- (void)startCountdownTimer
{
    self.userInteractionEnabled = false;
    self.mainTextLabel.textColor = self.invalidTextColor;
    self.mainTextLabel.backgroundColor = self.invalidBackdropColor;
    
    [self.countdownTimer invalidate];
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdownTimerAction) userInfo:nil repeats:YES];
    [self.countdownTimer fire];
}

- (void)countdownTimerAction
{
    if (_leftSeconds > 0) {
        self.mainTextLabel.text = [NSString stringWithFormat:@"重新获取(%lds)", _leftSeconds];
    } else {
        [self stopCountdown];
    }
    _leftSeconds--;
}

- (void)stopCountdown
{
    [self.countdownTimer invalidate];
    self.mainTextLabel.text = @"发送验证码";
    self.userInteractionEnabled = true;
    self.mainTextLabel.textColor = self.validTextColor;
    self.mainTextLabel.backgroundColor = self.validBackdropColor;
}

//页面倒计时状态检查（跳转到存在倒计时的页面时调用）
- (void)checkCountdownStatus
{
    if ([self.countdownTimer isValid]) {
        return;
    }
    _leftSeconds = [[JDCountdownSource sharedCountdownSource].refetchDate timeIntervalSinceNow];
    if (_leftSeconds > 0) {
        [self startCountdownTimer];
    } else {
        [self stopCountdown];
    }
}

@end
