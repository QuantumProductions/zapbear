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

- (void)adTapped {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.f touchBegan];
}

- (void)showMenu {
    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - self.arbitrary.frame.size.height)];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
}

- (void)hideMenu {
    [self.menu removeFromSuperview];
    self.menu = nil;
}


@end
