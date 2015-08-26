//
//  ViewController.m
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    size = [[UIScreen mainScreen] bounds].size;
    self.f = [[Field alloc] initWithVC:self];
    self.bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FlashBearAwfulBackground.png"]];
    [self.view insertSubview:self.bg atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showBg) name:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideBg) name:@"hidebg" object:nil];
}

- (void)showBg {
    self.bg.alpha = 1;
}

- (void)hideBg {
    self.bg.alpha = 0;
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
