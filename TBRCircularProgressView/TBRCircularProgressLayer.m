//
//  TBRCircularProgressLayer.m
//  TBRCircularProgressViewExample
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRCircularProgressLayer.h"

@interface TBRCircularProgressLayer ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation TBRCircularProgressLayer

- (instancetype)initWithFrame:(CGRect)frame
             progressFraction:(CGFloat)progressFraction
{
    self = [super init];
    if (self) {
        _progressFraction = progressFraction;
        
        self.position = CGPointMake(CGRectGetWidth(self.frame) * 0.5,
                                    CGRectGetHeight(self.frame) * 0.5);
        
        //Default tint color
        _tintColor = [UIColor colorWithRed:5.0/255.0
                                     green:122.0/255.0
                                      blue:255.0/255.0
                                     alpha:1.0];
        self.frame = frame;

        [self addSublayer:[self circularLayer]];
        [self addSublayer:self.progressLayer];
        
    }
    return self;
}

- (CAShapeLayer *)progressLayer
{
    if (_progressLayer == nil) {
        CGPoint centerPoint = CGPointMake(CGRectGetWidth(self.frame) * 0.5,
                                          CGRectGetHeight(self.frame) * 0.5);
        
        UIBezierPath *arcBezierPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                     radius:(self.frame.size.width - 3) *0.5
                                                                 startAngle:-M_PI * 0.5
                                                                   endAngle: M_PI * 1.5
                                                                  clockwise:YES];
        
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path = arcBezierPath.CGPath;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.strokeColor = self.tintColor.CGColor;
        _progressLayer.lineWidth = 3;
        _progressLayer.strokeStart = 0;
        _progressLayer.strokeEnd = 1.0 * self.progressFraction;
    }
    return _progressLayer;
}

- (CAShapeLayer *)circularLayer
{
    UIBezierPath *circularBezierPath = [UIBezierPath bezierPathWithOvalInRect:self.frame];
    CAShapeLayer *circularLayer = [CAShapeLayer layer];
    circularLayer.bounds = self.frame;
    circularLayer.path = circularBezierPath.CGPath;
    circularLayer.fillColor = [UIColor clearColor].CGColor;
    circularLayer.strokeColor = self.tintColor.CGColor;
    circularLayer.lineWidth = 1;
    circularLayer.position = CGPointMake(CGRectGetWidth(self.frame) * 0.5,
                                         CGRectGetHeight(self.frame) * 0.5);
    return circularLayer;
}

- (void)setProgressFraction:(CGFloat)progressFraction
{
    _progressFraction = progressFraction;
    self.progressLayer.strokeEnd = progressFraction;
}


@end
