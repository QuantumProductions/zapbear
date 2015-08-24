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

@interface Field : NSObject

@property (strong, nonatomic) Bear *bear;
@property (strong, nonatomic) Stage *stage;

@property (strong, nonatomic) UIViewController *vc;

@property (strong, nonatomic) NSTimer *timer;

- (void)showLightning;

- (id)initWithVC:(UIViewController *)vc;

- (void)showStorm;

- (void)touchBegan;

@end
