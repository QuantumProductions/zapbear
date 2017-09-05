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
    self.bg.frame = CGRectMake(0, 0, size.width, size.height);
    [self.view insertSubview:self.bg atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showBg) name:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideBg) name:@"hidebg" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu) name:@"showMenu" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideMenu) name:@"hideMenu" object:nil];
    state = Title;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.text = @"Tap on Zap";
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:50];
    self.titleLabel.center = CGPointMake(self.view.center.x, 50);
    self.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.titleLabel];
    
}

- (void)showBg {
    self.bg.alpha = 1;
}

- (void)hideBg {
    self.bg.alpha = 0;
    self.view.backgroundColor = [UIColor whiteColor];
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
//    self.menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - self.arbitrary.frame.size.height) points:0];
//    self.menu.delegate = self;
//    [self.view addSubview:self.menu];
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
