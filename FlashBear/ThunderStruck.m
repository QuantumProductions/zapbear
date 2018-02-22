//
//  ThunderStruck.m
//  FlashBear
//
//  Created by quantum on 26/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "ThunderStruck.h"
#import "Field.h"

@implementation ThunderStruck

- (id)initWithLightning:(Lightning *)l {
    self = [super init];
    [l removeFromSuperview];
    l = nil;
    [[Field shared] reportScores];
    ready = false;
    return self;
}

- (void)scoreLoop {
    
}

- (NSString *)noteName {
    return @"hidebg";
}

- (void)activate {
    [[NSNotificationCenter defaultCenter] postNotificationName:[self noteName] object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showMenu" object:nil];

    self.bear.image = [UIImage imageNamed:@"ZappedBear1.png"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getReady];
    });
}

- (void)getReady {
    ready = true;
}

- (void)touchBegan {
    if (!ready) {
        return;
    }
    [super touchBegan];
    [[Field shared].scorer reset];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideMenu" object:nil];
    [[Field shared] showStorm];
}

@end
