//
//  TBRCircularProgressLayer.h
//  TBRCircularProgressViewExample
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface TBRCircularProgressLayer : CALayer

@property (nonatomic) CGFloat progressFraction;

@property (nonatomic) UIColor *tintColor;

- (instancetype)initWithFrame:(CGRect)frame
             progressFraction:(CGFloat)progressFraction;
@end
