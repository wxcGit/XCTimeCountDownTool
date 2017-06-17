//
//  ViewController.m
//  XCTimeCountDownTool_demo
//
//  Created by wxc on 17/6/17.
//  Copyright © 2017年 wxc. All rights reserved.
//

#import "ViewController.h"
#import "XCTimeCountDownTool.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_countLabel];
    
    [XCTimeCountDownTool countDownWithCount:60 timeInterval:1 actionBlock:^(NSInteger count) {
        _countLabel.text = [NSString stringWithFormat:@"%ld",count];
    }];
}


@end
