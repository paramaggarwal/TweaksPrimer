//
//  CHShineView.m
//  TweaksPrimer
//
//  Created by Param Aggarwal on 05/07/14.
//  Copyright (c) 2014 CocoaHeads. All rights reserved.
//

#import "CHShineView.h"
#import <QuartzCore/QuartzCore.h>
#import "FBTweakInline.h"

@implementation CHShineView

+ (id)logoView {
    return [[CHShineView alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self setImage:[UIImage imageNamed:@"logo.png"]];
        self.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    }
    return self;
}

- (void)flash {
    CGFloat width = self.image.size.width;
    CGFloat height = self.image.size.height;
    
    CALayer *shineLayer = [CALayer layer];
    UIImage *shineImage = [UIImage imageNamed:@"logo-highlighted.png"];
    shineLayer.contents = (id)[shineImage CGImage];
    shineLayer.frame = CGRectMake(0, 1, width, height);
    
    CALayer *mask = [CALayer layer];
    mask.backgroundColor = [[UIColor clearColor] CGColor];
    UIImage *maskImage = [UIImage imageNamed:@"logo-mask.png"];
    mask.contents = (id)[maskImage CGImage];
    mask.contentsGravity = kCAGravityCenter;
    mask.frame = CGRectMake(-width, 0, width * 1.25, height);
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    anim.byValue = @(width * 2);
    anim.repeatCount = HUGE_VALF;
    anim.duration = FBTweakValue(@"Loading Animation", @"Shine", @"Duration", 1.0f);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addSublayer:shineLayer];
    shineLayer.mask = mask;
    
    [mask addAnimation:anim forKey:@"shine"];
    self.mask = mask;
}

- (void)setFlashingState:(BOOL)state {

    if (state) {
        [self flash];
    } else {
        [self.mask removeAnimationForKey:@"shine"];
    }
}

@end
