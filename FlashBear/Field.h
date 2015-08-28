//
//  Field.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bear.h"
#import "Stage.h"
#import "Lightning.h"
#import "Scorer.h"
#import "SoundPlayer.h"
#import "Menu.h"
#import <iAD/iAD.h>

@interface Field : NSObject <MenuDelegate> {
    CGSize size;
}

@property (strong, nonatomic) Bear *bear;
@property (strong, nonatomic) Stage *stage;
@property (strong, nonatomic) Scorer *scorer;

@property (strong, nonatomic) UIViewController *vc;
@property (strong, nonatomic) Menu *menu;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) SoundPlayer *soundPlayer;

@property (strong, nonatomic) ADBannerView *arbitrary;

- (void)showLightning;

- (id)initWithVC:(UIViewController *)vc;

- (void)showStorm;

- (void)touchBegan;

- (UIView *)view;

- (void)showZap;

- (bool)shouldStrikeBear:(Lightning *)l;

- (void)thunderStruck:(Lightning *)l;

- (ADBannerView *)arbitrary;

@end
