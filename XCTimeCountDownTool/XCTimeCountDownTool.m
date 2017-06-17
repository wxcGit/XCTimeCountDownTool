//
//  XCTimeCountDownTool.m
//  XCTimeCountDownTool_demo
//
//  Created by wxc on 17/6/17.
//  Copyright © 2017年 wxc. All rights reserved.
//

#import "XCTimeCountDownTool.h"

@interface XCTimeCountDownTool ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) void (^actionBlock)(NSInteger);

@property (nonatomic, assign) NSInteger countTime;
@property (nonatomic, assign) NSInteger timeInterval;

@end

@implementation XCTimeCountDownTool

+ (instancetype)countDownWithCount:(NSInteger)countTime timeInterval:(NSInteger)timeInterval actionBlock:(void (^)(NSInteger)) actionBlock
{
    return [[XCTimeCountDownTool alloc]initCountDownWithCount:countTime timeInterval:timeInterval actionBlock:actionBlock];
}

- (instancetype)initCountDownWithCount:(NSInteger)countTime timeInterval:(NSInteger)timeInterval actionBlock:(void (^)(NSInteger)) actionBlock
{
    self = [super init];
    if (self) {
        _actionBlock = actionBlock;
        _countTime = countTime;
        _timeInterval = timeInterval;
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterBckgroundAction) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appHasGoneInForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    
    return self;
}

- (void)timeAction:(NSTimer*)timer
{
    if (_countTime < 0) {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    if (_actionBlock) {
        _actionBlock(_countTime);
    }
    _countTime--;
}

- (void)enterBckgroundAction
{
    UIBackgroundTaskIdentifier backgroundTaskIdentifier = [[UIApplication sharedApplication]beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication]endBackgroundTask:backgroundTaskIdentifier];
    }];
    [self resetTimer];
}

- (void)appHasGoneInForeground
{
    [self resetTimer];
}

- (void)resetTimer
{
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
