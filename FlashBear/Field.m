//
//  Field.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Field.h"
#import "FlashStage.h"
#import "StormStage.h"

@implementation Field

- (id)initWithVC:(UIViewController *)vc {
    self = [super init];
    self.vc = vc;
    [self showStorm];
    self.timer = [NSTimer timerWithTimeInterval:.016 target:self selector:@selector(loop) userInfo:nil repeats:true] ;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    self.bear = [[Bear alloc] initWithFrame:CGRectMake(0, 0, 200, 332)];
    [self.bear setSize:[[UIScreen mainScreen] bounds].size];
    [self.bear plantBearOnGround];
    [self.view addSubview:self.bear];
    
    return self;
}

- (void)loop {
    [self.stage loop];
}

- (void)showLightning {
    self.stage = [[FlashStage alloc] initWithField:self];
}

- (void)showStorm {
    self.stage = [[StormStage alloc] initWithField:self];
}

- (void)touchBegan {
    [self.stage touchBegan];
}

- (UIView *)view {
    return self.vc.view;
}

@end
