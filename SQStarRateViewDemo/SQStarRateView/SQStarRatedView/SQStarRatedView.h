//
//  SQStarRatedView.h
//  SQStarRateView
//
//  Created by 酷风 on 17/2/25.
//  Copyright © 2017年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQStarRatedView;
@protocol SQStarRatedViewDelegate <NSObject>
@optional
/**
 *  评分代理方法，点击活着滑动时出发代理
 *
 *  @param starRateView    评星view
 *  @param newScorePercent 评星，0-1之间
 */
- (void)starRateView:(SQStarRatedView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;
@end

@interface SQStarRatedView : UIView
/**
 *    得分值，范围为0--1，默认为1
 */
@property (nonatomic, assign) CGFloat scorePercent;
/**
 *  是否允许动画，默认为NO
 */
@property (nonatomic, assign) BOOL hasAnimation;
/**
 *  评分时是否允许不是整星，默认为NO
 */
@property (nonatomic, assign) BOOL allowIncompleteStar;

@property (nonatomic, strong) UIImage *foregroundImage;
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 *  设置代理
 */
@property (nonatomic, weak) id<SQStarRatedViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

- (instancetype)initWithFrame:(CGRect)frame forgroundImageName:(NSString *)forgroundImageName backgImage:(NSString *)backgroundImageName;

@end
