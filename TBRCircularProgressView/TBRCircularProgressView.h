//
//  TBRCircularProgressView.h
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBRCircularProgressView : UIView

/**
 *  Set the progress fraction for the circular shape, stops the spinning animation
 */
@property (nonatomic) CGFloat progressFraction;

/**
 *  Tint color for view
 */
@property (nonatomic) UIColor *tintColor;

/**
 *  Call this method to start the spinning animation
 */
- (void)startLoadingAnimation;

/**
 *  Call this method to stop the spinning animation
 */
- (void)stopLoadingAnimation;

@end
