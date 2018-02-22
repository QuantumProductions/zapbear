//
//  Stage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Stage.h"
#import "Field.h"

@implementation Stage

- (void)activate {
    
}

- (id)init {
    self = [super init];
    [self activate];
    return self;
}

- (void)zapLoop {
    
}

- (void)bearLoop {
    [self.bear loop];
}

- (Bear *)bear {
    return [Field shared].bear;
}

- (void)scoreLoop {
    [[Field shared].scorer loop];
}

- (void)loop {
    [self scoreLoop];
    [self zapLoop];
    [self bearLoop];
}

- (UIViewController *)vc {
    return [Field shared].vc;
}

- (void)touchBegan {
    [self.bear jump];
}

- (UIView *)view {
    return [Field shared].view;
}

- (SoundPlayer *)soundPlayer {
    return [Field shared].soundPlayer;
}

@end
