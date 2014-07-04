//
//  CHViewController.m
//  TweaksPrimer
//
//  Created by Param Aggarwal on 05/07/14.
//  Copyright (c) 2014 CocoaHeads. All rights reserved.
//

#import "CHViewController.h"

@implementation CHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CHShineView *shineView = [CHShineView logoView];
    shineView.center = self.view.center;    
    [self.view addSubview:shineView];

    [shineView flash];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
