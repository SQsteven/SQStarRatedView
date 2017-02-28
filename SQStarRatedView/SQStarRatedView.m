//
//  SQStarRatedView.m
//  SQStarRateView
//
//  Created by 酷风 on 17/2/25.
//  Copyright © 2017年 steven. All rights reserved.
//

#import "SQStarRatedView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"sq_foreground_star"
#define BACKGROUND_STAR_IMAGE_NAME @"sq_background_star"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2

@interface SQStarRatedView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;
@property (nonatomic, assign) NSInteger numberOfStars;

@end

@implementation SQStarRatedView

#pragma mark - Init Methods
- (instancetype)init {
    NSAssert(NO, @"初始化必须调用有初始化frame的方法!");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildUIWithforegroundImage:FOREGROUND_STAR_IMAGE_NAME backgroundImage:BACKGROUND_STAR_IMAGE_NAME];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self buildUIWithforegroundImage:FOREGROUND_STAR_IMAGE_NAME backgroundImage:BACKGROUND_STAR_IMAGE_NAME];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame foregroundImageName:(NSString *)foregroundImageName backgImage:(NSString *)backgroundImageName
{
    if (self = [super initWithFrame:frame]) {
        [self buildUIWithforegroundImage:foregroundImageName backgroundImage:backgroundImageName];
    }
    return self;
}

#pragma mark - Private Methods

- (void)setForegroundStarImageName:(NSString *)foregroundImageName backgroundStarImageName:(NSString *)backgroundImageName
{
    self.foregroundStarView = [self createStarViewWithImage:foregroundImageName];
    self.backgroundStarView = [self createStarViewWithImage:backgroundImageName];
}

- (void)buildUIWithforegroundImage:(NSString *)foregroundImageName backgroundImage:(NSString *)backgroundImageName
{
    _scorePercent = 1;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO
    
    [self setForegroundStarImageName:foregroundImageName backgroundStarImageName:backgroundImageName];
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(userPanRateView:)];
    [self addGestureRecognizer:panGesture];
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
    //    NSLog(@"%d",(int)(self.scorePercent*10/2));
}

- (void)userPanRateView:(UITapGestureRecognizer *)gesture{
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        self.foregroundStarView.frame = CGRectMake(0, 0, self.bounds.size.width * self.scorePercent, self.bounds.size.height);
    }];
}

#pragma mark - Get and Set Methods

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:_scorePercent];
    }
    
    [self setNeedsLayout];
}



@end

