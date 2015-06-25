//
//  ViewController.m
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self positionBear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)positionBear
{
    int x = side ? (320*2/3) : (320/3);
    self.bear.center = CGPointMake(x, self.bear.center.y);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    side = !side;
    [self positionBear];
}

@end
