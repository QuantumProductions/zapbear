//
//  ViewController.m
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)loadTitle
{

}

- (void)viewDidAppear:(BOOL)animated
{
    if (!loaded) {
        loaded = true;
        startFlash = self.flashTitle.center;
        startBear = self.bearTitle.center;
        bearHasBeenHitOnce = false;
        [self animateTitle];
//        [self plantBearOnGround];
    }
}

- (void)animateTitle {
    self.flashTitle.alpha = 1;
    self.bearTitle.alpha = 1;

    self.flashTitle.center = CGPointMake(self.flashTitle.center.x, -50);
    self.bearTitle.center = CGPointMake(self.bearTitle.center.x, 700);
    [UIView animateWithDuration:.6
                     animations:^{
                         self.flashTitle.center =startFlash;
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [UIView animateWithDuration:.6 animations:^{
                                 self.bearTitle.center = startBear;
                             } completion:^(BOOL finished) {
                                 if (finished && !bearHasBeenHitOnce) {
                                     [self showTitleLightningStrike];
                                 }
                             }];
                         }
                     }];
}

- (void)showTitleLightningStrike
{
    self.lightning.x = size.width * .75;
//    [self.lightningPlayer play];
    [self.lightning strike];
    if (state == Title) {
        state = Ready;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    size = [[UIScreen mainScreen] bounds].size;
    [self loadTitle];
    self.f = [[Field alloc] initWithVC:self];
}

- (void)drawBackground
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"FlashBearAwfulBackground.png"] drawInRect:self.view.frame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)scoreTapped
{
//    [self showGameCenter];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.f touchBegan];

}

//- (void)setupLabels {
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, size.width, 40)];
//    self.label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.label];
//    
//    self.bestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, size.height - 150, size.width, 40)];
//    self.bestLabel.font = [UIFont boldSystemFontOfSize:40];
//    self.bestLabel.textColor = [UIColor whiteColor];
//    self.bestLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.bestLabel];
//    
//    self.highscoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, size.width, 40)];
//    self.highscoreLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.highscoreLabel];
//    self.highscoreLabel.textColor = [UIColor blackColor];
//    self.highscoreLabel.font = [UIFont systemFontOfSize:40];
//    
//    best = [[NSUserDefaults standardUserDefaults] integerForKey:@"best"];
//    
//    [self loadMoney];
//}

//- (void)showMenu:(NSInteger)p
//{
//    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - self.arbitrary.frame.size.height) points:p];
//    self.menu.delegate = self;
//    [self.view addSubview:self.menu];
//    
//    NSInteger total = [[NSUserDefaults standardUserDefaults] integerForKey:@"total"];
//    for (int i = points; i > 0; i--) {
//        total+= i;
//    }
//    
//    [[NSUserDefaults standardUserDefaults] setInteger:total forKey:@"total"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//}


@end
