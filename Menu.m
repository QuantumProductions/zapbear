//
//  Menu.m
//  FlashBear
//
//  Created by quantum on 27/06/2015.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "Menu.h"
#import <QuartzCore/QuartzCore.h>

@implementation Menu

- (id)initWithFrame:(CGRect)frame points:(NSInteger)pts {
    self = [super initWithFrame:frame];

    self.backgroundColor = [UIColor clearColor];
    
    //float w = frame.size.width * .25;

    points = pts;
    
    float h = frame.size.height * .20;
    
//    UIView *panel = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width * .15, frame.size.height * .5 - h, frame.size.width * .70, h * 1.2)];
//    panel.backgroundColor = [UIColor whiteColor];
//    [self addSubview:panel];
//    
//    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(panel.frame.size.width - 85, 0, 70, 25)];
//    score.font = [UIFont boldSystemFontOfSize:14];
//    score.text = @"SCORE";
//    score.textAlignment = NSTextAlignmentRight;
//    [panel addSubview:score];
//    
//    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(panel.frame.size.width - 65, 20, 50, 25)];
//    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)points];
//    self.scoreLabel.backgroundColor = [UIColor clearColor];
//    self.scoreLabel.textColor = [UIColor redColor];
//    self.scoreLabel.font = [UIFont systemFontOfSize:24];
//    self.scoreLabel.textAlignment = NSTextAlignmentRight;
//
//    [panel addSubview:self.scoreLabel];
//    
//    UILabel *best = [[UILabel alloc] initWithFrame:CGRectMake(panel.frame.size.width - 85, self.scoreLabel.frame.size.height + self.scoreLabel.frame.origin.y + 20, 70, 25)];
//    best.font = [UIFont boldSystemFontOfSize:14];
//    best.text = @"BEST";
//    best.textAlignment = NSTextAlignmentRight;
//    [panel addSubview:best];
//    
    
//    panel.layer.cornerRadius = 2.0f;
//    panel.clipsToBounds = YES;
//    self.highscoreLabel.textAlignment = NSTextAlignmentRight;
//    
//    [panel addSubview:self.highscoreLabel];
    
    
    UIButton *scoreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    [scoreButton setImage:[UIImage imageNamed:@"FlashBearAwfulScoreButton.png"] forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(scoreTapped) forControlEvents:UIControlEventTouchUpInside];
    scoreButton.center = CGPointMake(frame.size.width / 2, frame.size.height * .95);
    [self addSubview:scoreButton];

    UIView *adTapper = [[UIView alloc] initWithFrame:CGRectMake(0, scoreButton.frame.size.height + scoreButton.frame.origin.y, frame.size.width, frame.size.height * .2)];
    adTapper.userInteractionEnabled = true;
    [adTapper addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adTapped)]];
    
    return self;
}

- (void)adTapped {
    [self.delegate adTapped];
}


- (void)scoreTapped {
    [self.delegate scoreTapped];
}

@end
