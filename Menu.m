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
    self.backgroundColor = [UIColor whiteColor];
    self.lightningLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, frame.size.width / 2, 50)];
    self.lightningLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"lightning"]];
    [self addSubview:self.lightningLabel];
    
    UILabel *lightningText = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, frame.size.width / 2, 50)];
    lightningText.text = @"ϟ";
    
    self.backgroundColor = [UIColor whiteColor];
    self.deadBearLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2, 200, frame.size.width / 2, 50)];
    self.deadBearLabel.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"strikes"]];
    
    UILabel *deadBearText = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2, 250, frame.size.width / 2, 50)];
    deadBearText.text = @"⊂( x (ェ) x )⊃";
    
    for (UILabel *l in @[self.lightningLabel, lightningText, self.deadBearLabel, deadBearText]) {
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
