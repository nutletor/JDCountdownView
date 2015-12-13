//
//  JDCountdownSource.h
//  JDCountdownViewDemo
//
//  Created by HuangFei on 15/12/13.
//  Copyright © 2015年 HuangFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDCountdownSource : NSObject

@property (nonatomic, strong) NSDate *refetchDate;//允许重发验证码的时间点

+ (instancetype)sharedCountdownSource;

@end
