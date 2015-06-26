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
    
    self.timer = [NSTimer timerWithTimeInterval:.016 target:self selector:@selector(timerFire) userInfo:nil repeats:true] ;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    gravity = 1;
    jumpForce = 15;
    fallSpeed = 0;
    size = [[UIScreen mainScreen] bounds].size;
    
}

- (void)timerFire {
    NSLog([NSString stringWithFormat:@"%f", fallSpeed]);
    [self applyFalling];

}

- (bool)bearReachedGround
{
    return self.bear.frame.origin.y + self.bear.frame.size.height >= size.height;
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
    [self jump];
}

- (void)jump
{
    self.bear.backgroundColor = [UIColor greenColor];
    fallSpeed = -jumpForce;
    //bearIsGrounded = false;
    self.bear.center = CGPointMake(self.bear.center.x, self.bear.center.y - 1);
}

- (void)plantBearOnGround {
        self.bear.center = CGPointMake(self.bear.center.x, size.height - self.bear.frame.size.height/2);
}

- (void)applyFalling
{
    if (![self bearReachedGround])  //(!bearIsGrounded)
    {
        self.bear.center = CGPointMake(self.bear.center.x, self.bear.center.y + fallSpeed);
        fallSpeed += gravity;
        
        
        if ([self bearReachedGround])
        {
            NSLog(@"got here");
            fallSpeed = 0;
            self.bear.backgroundColor = [UIColor blueColor];
            [self plantBearOnGround];
        }
    }
}


@end
