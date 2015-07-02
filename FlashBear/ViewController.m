//
//  ViewController.m
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)loadSounds
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"jump" ofType:@"wav"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"wav"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    self.musicPlayer.numberOfLoops = -1;
    [self.musicPlayer play];

}

- (void)preparePhysics
{
    gravity = 2.2;
    jumpForce = 24;
    fallSpeed = 0;
    
    xPosEpsilon = 0.001;
    xMoveInverseAcceleration = 6.5;
    isInXPlace = false;
}

- (void)loadTitle
{
}

- (void)viewDidAppear:(BOOL)animated
{
    CGPoint flash = self.flashTitle.center;
    CGPoint bear = self.bearTitle.center;
    self.flashTitle.center = CGPointMake(self.flashTitle.center.x, -50);
    self.bearTitle.center = CGPointMake(self.bearTitle.center.x, 700);
        [UIView animateWithDuration:.6
                         animations:^{
                             self.flashTitle.center = flash;
                         } completion:^(BOOL finished) {
                             if (finished) {
                                 [UIView animateWithDuration:.6 animations:^{
                                     self.bearTitle.center = bear;
                                 } completion:^(BOOL finished) {
                                     if (finished) {
                                         [self showTitleLightningStrike];
                                     }
                                 }];
                             }
                         }];
    
}

- (void)showTitleLightningStrike
{
    self.lightning.x = size.width * .75;
    [self.lightning strike];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    size = [[UIScreen mainScreen] bounds].size;
    [self loadTitle];
    
    self.lightning = [[Lightning alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.lightning];

    [self loadSounds];
    
    self.timer = [NSTimer timerWithTimeInterval:.016 target:self selector:@selector(loop) userInfo:nil repeats:true] ;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    [self preparePhysics];

    [self delayLightning];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 40)];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    best = [[NSUserDefaults standardUserDefaults] integerForKey:@"best"];
    
}

- (void)delayLightning
{
    lightningDelay = arc4random() % 500;
    lightningDelay += 80;
    lastLightningDelay = lightningDelay;
    self.view.backgroundColor = [UIColor colorWithRed:113.0/255.0 green:119.0/255.0 blue:190.0/255.0 alpha:1];
    self.label.text = [NSString stringWithFormat:@"%d", points];
    int fontSize = 18 + points;
    if (fontSize > 82) {
        fontSize = 82;
    }
    self.label.font = [UIFont boldSystemFontOfSize:fontSize];
}

- (void)prepareLightningStrike
{
    framesUntilLightningStrike = 23;
    self.lightning.x = self.bear.center.x < size.width / 2 ? size.width * .25 : size.width * .75;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)lightningLoop
{
    if (lightningDelay) {
        lightningDelay--;
        if (self.lightning.alpha && lightningDelay < lastLightningDelay - 10) {
            self.lightning.alpha = 0;
        }
        if (lightningDelay <= 0) {
            lightnings++;
            [self prepareLightningStrike];
        }
    } else {
        framesUntilLightningStrike--;
        if (framesUntilLightningStrike <= 0) {
            [self.lightning strike];
            self.lightning.alpha = 1;
            if (dodged) {
                [self scorePoint];
            } else {
                [self lightningStrikesBear];
            }
            dodged = false;
            [self delayLightning];
        }
    }
}

- (void)showMenu:(NSInteger)p
{
    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) points:p];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
}

- (void)retryTapped
{
    [self.menu removeFromSuperview];
    self.menu = nil;
    [self delayLightning];
}

- (void)lightningStrikesBear
{
    NSInteger bearDeaths = [[NSUserDefaults standardUserDefaults] integerForKey:@"strikes"];
    bearDeaths++;
    [[NSUserDefaults standardUserDefaults] setInteger:bearDeaths forKey:@"strikes"];
    
    NSInteger lightning = [[NSUserDefaults standardUserDefaults] integerForKey:@"lightning"];
    lightning+= lightnings;
    lightnings = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:lightning forKey:@"lightning"];

    NSInteger savedBest = [[NSUserDefaults standardUserDefaults] integerForKey:@"best"];
    if (best >= savedBest) {
        [[NSUserDefaults standardUserDefaults] setInteger:best forKey:@"best"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
  
    [self showMenu:points];
    points = 0;
}

- (void)scorePoint
{
    points++;
    if (points > best) {
        best = points;
    }
}

- (void)loop
{
    if (state == Storm) {
        [self applyFalling];
        
        [self positionBear];

        if (!self.menu) {
            [self lightningLoop];
        }
    }
}

- (bool)bearReachedGround
{
    return self.bear.frame.origin.y + self.bear.frame.size.height >= size.height;
}

- (int)targetX {
    return onLeftSide ? (320*2/3) - 10 : (320/3) + 10;
}

- (void)positionBear
{
    int xTarget = [self targetX];
    if(!isInXPlace && self.bear.center.x - xTarget < xPosEpsilon && xTarget - self.bear.center.x < xPosEpsilon)
    {
        self.bear.center = CGPointMake(xTarget, self.bear.center.y);
        isInXPlace = true;
    }
    else
    {
        float xIncrement = ABS(self.bear.center.x - xTarget)/xMoveInverseAcceleration;
        int xDirection = -ABS(self.bear.center.x - xTarget)/(self.bear.center.x - xTarget);
        self.bear.center = CGPointMake((self.bear.center.x + xIncrement*xDirection), self.bear.center.y);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (state == Title) {
        state = Storm;
        self.flashTitle.alpha = 0;
        self.bearTitle.alpha = 0;
        self.lightning.alpha = 0;
        [self delayLightning];
        [self jump];
    } else {
        if([self bearReachedGround])
        {
            [self jump];
        }
        
    }
}

- (void)jump
{
    onLeftSide = !onLeftSide;
    isInXPlace = false;
    fallSpeed = -jumpForce;
    self.bear.center = CGPointMake(self.bear.center.x, self.bear.center.y - 1);
    if (!lightningDelay) {
        dodged = true;
    }

}

- (void)plantBearOnGround {
    self.bear.center = CGPointMake(self.bear.center.x, size.height - self.bear.frame.size.height/2);
}

- (void)applyFalling
{
    if ([self bearReachedGround])
    {
        fallSpeed = 0;
        [self plantBearOnGround];
    } else {
        self.bear.center = CGPointMake(self.bear.center.x, self.bear.center.y + fallSpeed);
        fallSpeed += gravity;
        
        
        if ([self bearReachedGround])
        {
            fallSpeed = 0;
            [self plantBearOnGround];
        }
    }
}


@end
