//
//  TBRCircularActivityLayer.m
//  TBRCircularProgressViewExample
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRCircularActivityLayer.h"

static const CGFloat kRadiansPerSecond = M_PI * 1.3;
static const CGFloat kFramesPerSecond = 30.0;

@interface TBRCircularActivityLayer ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDate *previousDate;

@end

@implementation TBRCircularActivityLayer

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super init]))
    {
        self.frame = frame;
        self.bounds = frame;
        self.position = CGPointMake(CGRectGetWidth(self.frame) * 0.5,
                                    CGRectGetHeight(self.frame) * 0.5);
        
        CGFloat lineWidth = 1;
        CGPoint centerPoint = CGPointMake(CGRectGetMidX(frame),
                                          CGRectGetMidY(frame));
        
        UIBezierPath *arcBezierPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                     radius:(self.frame.size.width - lineWidth) *0.5
                                                                 startAngle:0
                                                                   endAngle:M_PI * 1.85
                                                                  clockwise:YES];
        
        self.path = arcBezierPath.CGPath;
        _tintColor = [UIColor colorWithRed:5.0/255.0
                                     green:122.0/255.0
                                      blue:255.0/255.0
                                     alpha:1.0];
        
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = _tintColor.CGColor;
        self.lineWidth = lineWidth;
    }
    return self;
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    self.strokeColor = tintColor.CGColor;
}

- (void)startAnimating
{
    self.previousDate = [NSDate date];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / kFramesPerSecond
                                                  target:self
                                                selector:@selector(updateRotation)
                                                userInfo:nil
                                                 repeats:YES];
}


- (void)stopAnimating
{
    [self.timer invalidate];
}


- (void)updateRotation
{
    NSTimeInterval timeInterval = -[self.previousDate timeIntervalSinceNow];
    self.affineTransform = CGAffineTransformMakeRotation(kRadiansPerSecond * timeInterval);
}



@end
