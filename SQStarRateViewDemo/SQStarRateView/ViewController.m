//
//  ViewController.m
//  SQStarRateView
//
//  Created by 酷风 on 17/2/25.
//  Copyright © 2017年 steven. All rights reserved.
//

#import "ViewController.h"
#import <SQStarRatedView.h>

@interface ViewController ()<SQStarRatedViewDelegate>

@property (nonatomic, strong) SQStarRatedView *starRatedView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.starRatedView = [[SQStarRatedView alloc] initWithFrame:CGRectMake(10, 100, 200, 19) numberOfStars:5];
    self.starRatedView.scorePercent = 0;
    self.starRatedView.delegate = self;
    self.starRatedView.allowIncompleteStar = NO;
    self.starRatedView.hasAnimation = YES;
    [self.view addSubview:self.starRatedView];
    
    
    NSString *aString = @"adddda";
    CGSize size =[aString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    UILabel *lb = [[UILabel alloc] init];
    [self.view addSubview:lb];
    lb.text = aString;
    lb.frame = CGRectMake(100, 300, size.width, size.height);
//    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:aString];
//    NSRange range = NSMakeRange(0, atrString.length);
//    NSDictionary *dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    
//    size = [aString boundingRectWithSize:CGSizeMake(237, 200)  options:NSStringDrawingUsesLineFragmentOriginattributes:diccontext:nil].size;
}

- (void)starRateView:(SQStarRatedView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
