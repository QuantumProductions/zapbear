//
//  Menu.m
//  FlashBear
//
//  Created by quantum on 27/06/2015.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import "Menu.h"
#import <QuartzCore/QuartzCore.h>

@implementation Menu

- (id)initWithFrame:(CGRect)frame points:(NSInteger)pts {
    self = [super initWithFrame:frame];

    self.backgroundColor = [UIColor clearColor];
    
    //float w = frame.size.width * .25;

    points = pts;
    
    
    UIButton *scoreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 70)];
    [scoreButton setTitle:@"LEADERBOARD" forState:UIControlStateNormal];
    [scoreButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [scoreButton setBackgroundColor:[UIColor blackColor]];
//    [scoreButton setImage:[UIImage imageNamed:@"FlashBearAwfulScoreButton.png"] forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(scoreTapped) forControlEvents:UIControlEventTouchUpInside];
    scoreButton.center = CGPointMake(frame.size.width / 2, frame.size.height - 100);
    [self addSubview:scoreButton];
   
    return self;
}

- (void)scoreTapped {
    [self.delegate scoreTapped];
}

@end
