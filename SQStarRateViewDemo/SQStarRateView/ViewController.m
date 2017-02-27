//
//  ViewController.m
//  SQStarRateView
//
//  Created by 酷风 on 17/2/25.
//  Copyright © 2017年 steven. All rights reserved.
//

#import "ViewController.h"
#import <SQStarRatedView.h>

@interface ViewController ()

@property (nonatomic, strong) SQStarRatedView *starRatedView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SQStarRatedView *view = [[SQStarRatedView alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
//    [self.view addSubview:view];
    self.starRatedView = [[SQStarRatedView alloc] initWithFrame:CGRectMake(10, 100, 200, 19) numberOfStars:5];
    self.starRatedView.scorePercent = 0;
    self.starRatedView.delegate = self;
    //    self.starRateView.allowIncompleteStar = YES;
    self.starRatedView.allowIncompleteStar = NO;
    self.starRatedView.hasAnimation = YES;
    [self.view addSubview:self.starRateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
