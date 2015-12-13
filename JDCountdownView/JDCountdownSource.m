//
//  JDCountdownSource.m
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/13.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import "JDCountdownSource.h"

@implementation JDCountdownSource

+ (instancetype)sharedCountdownSource
{
    static JDCountdownSource * countdownSource;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        countdownSource = [[JDCountdownSource alloc] init];
    });
    return countdownSource;
}

@end
