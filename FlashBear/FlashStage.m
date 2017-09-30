//
//  FlashStage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "FlashStage.h"
#import "Field.h"

@implementation FlashStage

- (void)flashBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSString *)noteName {
    return @"hidebg";
}

- (void)activate {
    [self flashBackground];
    flash = 8;
    [[NSNotificationCenter defaultCenter] postNotificationName:[self noteName] object:nil];
    [self.soundPlayer playThunder];
}

- (void)zapLoop {
    flash--;
    if (flash == 0) {
        [self.f showZap];
    }
}

@end
