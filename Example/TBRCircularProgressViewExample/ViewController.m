//
//  ViewController.m
//  TBRCircularProgressViewExample
//
//  Created by Luciano Marisi on 15/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "ViewController.h"
#import "TBRCircularProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet TBRCircularProgressView *circularProgressView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDate *previousDate;
@property (nonatomic) CGFloat progressFraction;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.progressFraction = 0.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.circularProgressView startLoadingAnimation];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 60.0
                                                          target:self
                                                        selector:@selector(updateProgressView)
                                                        userInfo:nil
                                                         repeats:YES];
        });
    });
}

- (void)updateProgressView
{
    NSTimeInterval timeInterval = -[self.previousDate timeIntervalSinceNow];
    
    self.progressFraction += 0.2 * timeInterval;
    if (self.progressFraction > 1.0) {
        self.progressFraction = 1.0;
    }
    
    self.circularProgressView.progressFraction = self.progressFraction;
    self.previousDate = [NSDate date];
}



@end
