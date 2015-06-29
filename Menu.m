//
//  Menu.m
//  FlashBear
//
//  Created by quantum on 27/06/2015.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "Menu.h"

@implementation Menu

- (id)initWithFrame:(CGRect)frame points:(NSInteger)points {
    self = [super initWithFrame:frame];
    
    float w = frame.size.width * .25;
    
    float h = 50;
    float h2 = h + 50;
    
    self.backgroundColor = [UIColor whiteColor];
    self.lightningLabel = [[UILabel alloc] initWithFrame:CGRectMake(w, h, w, 50)];
    self.lightningLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"lightning"]];
    self.lightningLabel.center = CGPointMake(w, h);
    [self addSubview:self.lightningLabel];
    
    UILabel *lightningText = [[UILabel alloc] initWithFrame:CGRectMake(w, h2, w, 50)];
    lightningText.text = @"ϟ";
    lightningText.center = CGPointMake(w, h2);
    
    self.highscoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(w * 2, h, w, 50)];
    self.highscoreLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"best"]];
    self.highscoreLabel.center = CGPointMake(w * 2, h);
    
    UILabel *bestText = [[UILabel alloc] initWithFrame:CGRectMake(w * 2, h2, w, 50)];
    bestText.text = @"BEST";
    bestText.center = CGPointMake(w * 2, h2);
    
    self.backgroundColor = [UIColor whiteColor];
    self.deadBearLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, h, 50)];
    self.deadBearLabel.center = CGPointMake(w * 3, h);
    self.deadBearLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"strikes"]];
    
    UILabel *deadBearText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 50)];
    deadBearText.center = CGPointMake(w * 3, h2);
    deadBearText.text = @"⊂(x(ェ)x)⊃";
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w * 2, w * 2)];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)points];
    self.scoreLabel.font = [UIFont systemFontOfSize:60];

    for (UILabel *l in @[self.highscoreLabel, bestText, self.lightningLabel, lightningText, self.deadBearLabel, deadBearText, self.highscoreLabel, bestText, self.scoreLabel]) {
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = [UIColor blackColor];
        [self addSubview:l];
    }
    
    self.scoreLabel.center = CGPointMake(frame.size.width / 2, frame.size.width / 2);
    
    self.userInteractionEnabled = true;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retryTapped)]];

    return self;
}

- (void)retryTapped {
    [self.delegate retryTapped];
}

@end
