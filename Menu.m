//
//  Menu.m
//  FlashBear
//
//  Created by quantum on 27/06/2015.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "Menu.h"

@implementation Menu

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    float w = frame.size.width * .25;
    
    self.backgroundColor = [UIColor whiteColor];
    self.lightningLabel = [[UILabel alloc] initWithFrame:CGRectMake(w, 200, w, 50)];
    self.lightningLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"lightning"]];
    self.lightningLabel.center = CGPointMake(w, 200);
    [self addSubview:self.lightningLabel];
    
    UILabel *lightningText = [[UILabel alloc] initWithFrame:CGRectMake(w, 250, w, 50)];
    lightningText.text = @"ϟ";
    lightningText.center = CGPointMake(w, 250);
    
    self.highscoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(w * 2, 200, w, 50)];
    self.highscoreLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"best"]];
    self.highscoreLabel.center = CGPointMake(w * 2, 200);
    
    UILabel *bestText = [[UILabel alloc] initWithFrame:CGRectMake(w * 2, 250, w, 50)];
    bestText.text = @"BEST";
    bestText.center = CGPointMake(w * 2, 250);
    
    self.backgroundColor = [UIColor whiteColor];
    self.deadBearLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 50)];
    self.deadBearLabel.center = CGPointMake(w * 3, 200);
    self.deadBearLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"strikes"]];
    
    UILabel *deadBearText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 50)];
    deadBearText.center = CGPointMake(w * 3, 250);
    deadBearText.text = @"⊂(x(ェ)x)⊃";
    
    for (UILabel *l in @[self.highscoreLabel, bestText, self.lightningLabel, lightningText, self.deadBearLabel, deadBearText, self.highscoreLabel, bestText]) {
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = [UIColor blackColor];
        [self addSubview:l];
    }

    self.userInteractionEnabled = true;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retryTapped)]];

    return self;
}

- (void)retryTapped {
    [self.delegate retryTapped];
}

@end
