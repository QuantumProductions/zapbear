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

- (id)initWithField:(Field *)field lightning:(Lightning *)l {
    self = [super initWithField:field];
    [l removeFromSuperview];
    l = nil;
    [self.f reportScores];
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
    [self.f.scorer reset];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideMenu" object:nil];
    [self.f showStorm];
}

@end
