//
//  TBRCircularActivityLayer.h
//  TBRCircularProgressViewExample
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface TBRCircularActivityLayer : CAShapeLayer

@property (nonatomic, strong) UIColor *tintColor;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)startAnimating;

- (void)stopAnimating;

@end
