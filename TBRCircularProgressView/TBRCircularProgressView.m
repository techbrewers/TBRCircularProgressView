//
//  TBRCircularProgressView.m
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRCircularProgressView.h"
#import "TBRCircularActivityLayer.h"
#import "TBRCircularProgressLayer.h"

@interface TBRCircularProgressView ()

@property (nonatomic, strong) TBRCircularActivityLayer *circularActivityLayer;
@property (nonatomic, strong) TBRCircularProgressLayer *circularProgressLayer;

@end

@implementation TBRCircularProgressView

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [self commonInit];
}

- (void)commonInit
{
    // Default values
    self.backgroundColor = [UIColor clearColor];
    
    self.progressFraction = 0.0;
    CGRect frame = self.frame;
    self.circularActivityLayer = [[TBRCircularActivityLayer alloc] initWithFrame:frame];
    self.circularActivityLayer.hidden = YES;
    [self.layer addSublayer:self.circularActivityLayer];
    
    
    self.circularProgressLayer = [[TBRCircularProgressLayer alloc] initWithFrame:frame
                                                                progressFraction:self.progressFraction];
    self.circularProgressLayer.position = CGPointMake(self.bounds.size.width / 2,
                                                      self.bounds.size.height / 2);
    [self.layer addSublayer:self.circularProgressLayer];
    
}

#pragma mark - Public methods

- (void)startLoadingAnimation
{
    self.circularProgressLayer.hidden = YES;
    self.circularActivityLayer.hidden = NO;
    [self.circularActivityLayer startAnimating];
}

- (void)stopLoadingAnimation
{
    self.circularActivityLayer.hidden = YES;
    [self.circularActivityLayer stopAnimating];
}

#pragma mark - Custom setters

- (void)setProgressFraction:(CGFloat)progressFraction
{
    _progressFraction = progressFraction;
    [self stopLoadingAnimation];
    self.circularProgressLayer.hidden = NO;
    self.circularProgressLayer.progressFraction = self.progressFraction;
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    self.circularActivityLayer.tintColor = tintColor;
    self.circularProgressLayer.tintColor = tintColor;
}


@end
