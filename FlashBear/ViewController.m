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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadMoney) name:@"loadMoney" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu) name:@"showMenu" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideMenu) name:@"hideMenu" object:nil];

    
    
}

- (void)showBg {
    self.bg.alpha = 1;
}

- (void)hideBg {
    self.bg.alpha = 0;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)scoreTapped {
   [self showGameCenter];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.f touchBegan];
}

- (void)showMenu {
    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - self.arbitrary.frame.size.height) points:0];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
}

- (void)hideMenu {
    [self.menu removeFromSuperview];
    self.menu = nil;
}

- (NSArray *)scores {
    GKScore *pts = [[GKScore alloc] initWithLeaderboardIdentifier:@"flashbear_lightning_dodges"];
    pts.value = best;
    return @[pts];
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
    [self dismissViewControllerAnimated:false completion:^{
        
    }];
    
}

- (void)authenticateLocalPlayer {
    __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
    };
}

- (void)reportScores {
    self.scoresToReport = [self scores];
    for (GKScore *s in self.scoresToReport) {
        NSLog(@"score: %lld", s.value);
    }
    [GKScore reportScores:self.scoresToReport withCompletionHandler:^(NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

- (void)showGameCenter {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    
    if (gameCenterController != nil) {
        gameCenterController.gameCenterDelegate = self;
        [self presentViewController:gameCenterController animated:false completion:^{
            
        }];
    } else {
        
    }
}


@end
