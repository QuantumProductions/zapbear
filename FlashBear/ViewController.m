//
//  ViewController.m
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "ViewController.h"
#import "Colors.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    size = [[UIScreen mainScreen] bounds].size;
    
    self.banner = [[GADBannerView alloc] initWithFrame:CGRectMake(0, size.height - 44, size.width, 44)];
    
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-8143809646615023~3124447940"];
    
    self.banner.adUnitID = @"ca-app-pub-8143809646615023/9306712917";
    self.banner.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    
//    request.testDevices = @[ kGADSimulatorID ];
    [self.banner loadRequest:request];
    [self.view addSubview:self.banner];
    
    
    self.f = [Field main:self];
//    [[Field alloc] initWithVC:self];
    self.bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FlashBearAwfulBackground.png"]];
    self.bg.frame = CGRectMake(0, 0, size.width, size.height - 44);
    [self.view insertSubview:self.bg atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showBg) name:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideBg) name:@"hidebg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideRedBg) name:@"hideredbg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu) name:@"showMenu" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideMenu) name:@"hideMenu" object:nil];
    state = Title;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.text = @"Tap = Jump";
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:50];
    self.titleLabel.center = CGPointMake(self.view.center.x, 150);
    self.titleLabel.textColor = [Colors bg];
    [self.view addSubview:self.titleLabel];
    
}

- (void)showBg {
    self.bg.alpha = 1;
    self.titleLabel.alpha = 0;
}

- (void)hideBg {
    self.bg.alpha = 0;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)hideRedBg {
    self.bg.alpha = 0;
    self.view.backgroundColor = [Colors red];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (state == Title) {
        state = Storm;
        [self showBg];
        [self.f start];
        self.titleLabel.alpha = 0;
    }
    
    [self.f touchBegan];
}

- (void)showMenu {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showRealMenu];
    });
}

- (void)showRealMenu {
    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - 60) points:0];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
    self.titleLabel.alpha = 1;
}

//- (BOOL)prefersStatusBarHidden {
//    return true;
//}

- (void)hideMenu {
    [self.menu removeFromSuperview];
    self.menu = nil;
}

- (void)scoreTapped {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showscores" object:nil];
}


@end
