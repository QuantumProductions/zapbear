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
#import "ZapStage.h"
#import "ThunderStruck.h"

@implementation Field

- (id)initWithVC:(UIViewController *)vc {
    self = [super init];
    self.vc = vc;
    [self showStorm];
    self.timer = [NSTimer timerWithTimeInterval:.016 target:self selector:@selector(loop) userInfo:nil repeats:true] ;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    self.bear = [[Bear alloc] initWithFrame:CGRectMake(0, 0, 200, 332)];
    size = [[UIScreen mainScreen] bounds].size;
    [self.bear setSize:size];
    [self.bear plantBearOnGround];
    [self.view addSubview:self.bear];

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 40)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:self.label];
    self.scorer = [[Scorer alloc] init];

    self.soundPlayer = [[SoundPlayer alloc] init];
    
    return self;
}

- (void)scoreLoop {
    self.label.text = [self.scorer description];
}

- (void)loop {
    [self.stage loop];
    [self scoreLoop];
}

- (void)showLightning {
    self.stage = [[FlashStage alloc] initWithField:self];
}

- (void)showStorm {
    if (self.stage.class == [ZapStage class]) {
        ZapStage *z = (ZapStage *)self.stage;
        [z.lightning removeFromSuperview];
        z.lightning = nil;
    }
    self.stage = [[StormStage alloc] initWithField:self];
}

- (void)showZap {
   self.stage = [[ZapStage alloc] initWithField:self];
}

- (void)touchBegan {
    [self.stage touchBegan];
}

- (UIView *)view {
    return self.vc.view;
}

- (bool)shouldStrikeBear:(Lightning *)l {
    bool bearOnLeft = self.bear.center.x < size.width / 2;
    bool lightningLeft = l.latest.x < size.width / 2;
    
    if (lightningLeft && bearOnLeft) {
        return true;
    } else if (!lightningLeft && !bearOnLeft) {
        return true;
    }
    return false;
}

- (void)thunderStruck:(Lightning *)l {
    self.stage = [[ThunderStruck alloc] initWithField:self lightning:l];
}

@end
