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
    return self;
}

- (void)scoreLoop {
    
}

- (void)activate {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hidebg" object:nil];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadMoney" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showMenu" object:nil];

    self.bear.image = [UIImage imageNamed:@"ZappedBear1.png"];
}

- (void)touchBegan {
    [super touchBegan];
    [self.f.scorer reset];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showbg" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideMenu" object:nil];
    [self.f showStorm];
}

@end
