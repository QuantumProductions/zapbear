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
#import "Scorer.h";

@interface Field : NSObject {
    CGSize size;
}

@property (strong, nonatomic) Bear *bear;
@property (strong, nonatomic) Stage *stage;
@property (strong, nonatomic) Scorer *scorer;

@property (strong, nonatomic) UIViewController *vc;

@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) NSTimer *timer;

- (void)showLightning;

- (id)initWithVC:(UIViewController *)vc;

- (void)showStorm;

- (void)touchBegan;

- (UIView *)view;

- (void)showZap;

- (bool)shouldStrikeBear:(Lightning *)l;

@end
