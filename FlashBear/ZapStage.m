//
//  ZapStage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "ZapStage.h"
#import "Field.h"

@implementation ZapStage

- (void)createLightning {
    self.lightning = [[Lightning alloc] initWithFrame:self.view.frame];
}

- (void)activate {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showbg" object:nil];
    [self createLightning];
    [self.view addSubview:self.lightning];
    self.view.backgroundColor = [UIColor blackColor];
    afterImageFrames = 50;
    [self.soundPlayer playLightning];
}

- (void)zapLoop {
    if ([self.lightning struck]) {
        afterImageFrames--;
        if (afterImageFrames <= 0) {
            [self.bear redraw];
            [[Field shared] showStorm];
        }
    } else {
        [self.lightning strike];
    }
}


@end
