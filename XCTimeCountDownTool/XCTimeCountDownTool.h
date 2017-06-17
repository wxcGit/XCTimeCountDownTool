//
//  XCTimeCountDownTool.h
//  XCTimeCountDownTool_demo
//
//  Created by wxc on 17/6/17.
//  Copyright © 2017年 wxc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCTimeCountDownTool : NSObject

/**
 类方法

 @param countTime    执行次数 倒计时总时间
 @param timeInterval 间隔
 @param actionBlock  循环执行block

 @return             实例
 */
+ (instancetype)countDownWithCount:(NSInteger)countTime timeInterval:(NSInteger)timeInterval actionBlock:(void (^)(NSInteger)) actionBlock;


/**
 类方法
 
 @param countTime    执行次数 倒计时总时间
 @param timeInterval 间隔
 @param actionBlock  循环执行block
 
 @return             实例
 */
- (instancetype)initCountDownWithCount:(NSInteger)countTime timeInterval:(NSInteger)timeInterval actionBlock:(void (^)(NSInteger)) actionBlock;

@end
