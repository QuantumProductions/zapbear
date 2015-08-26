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

- (void)activate {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showbg" object:nil];
    self.lightning = [[Lightning alloc] initWithFrame:self.view.frame field:self.f];
    [self.view addSubview:self.lightning];
    self.view.backgroundColor = [UIColor blackColor];
    afterImageFrames = 50;
}

- (void)zapLoop {
    if ([self.lightning struck]) {
        afterImageFrames--;
        if (afterImageFrames <= 0) {
            [self.bear redraw];
            [self.f showStorm];
        }
    } else {
        [self.lightning strike];
    }
}


@end
