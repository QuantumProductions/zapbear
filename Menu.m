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

    self.backgroundColor = [UIColor clearColor];
    
    //float w = frame.size.width * .25;
    
    //float h = 50;
    //float h2 = h + 50;
    
    
    UIButton *retryButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    [retryButton setImage:[UIImage imageNamed:@"FlashBearAwfulPlayButton.png"] forState:UIControlStateNormal];
    [retryButton addTarget:self action:@selector(retryTapped) forControlEvents:UIControlEventTouchUpInside];
    retryButton.center = CGPointMake(frame.size.width / 2 - 90, frame.size.height * .95);
    [self addSubview:retryButton];
    
    UIButton *scoreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    [scoreButton setImage:[UIImage imageNamed:@"FlashBearAwfulScoreButton.png"] forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(scoreTapped) forControlEvents:UIControlEventTouchUpInside];
    scoreButton.center = CGPointMake(frame.size.width / 2 + 90, frame.size.height * .95);
    [self addSubview:scoreButton];

    return self;
}

- (void)retryTapped {
    [self.delegate retryTapped];
}

- (void)scoreTapped {

}

@end
