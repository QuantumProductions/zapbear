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
    
}

@end
