//
//  Bear.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Bear.h"

@implementation Bear

- (void)preparePhysics
{
    gravity = .8;
    jumpForce = 6;
    fallSpeed = 0;
    
    xPosEpsilon = 0.001;
    xMoveInverseAcceleration = 10;
    isInXPlace = false;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.image = [UIImage imageNamed:@"FlashBearProto.png"];
    [self preparePhysics];
    return self;
}

- (bool)bearReachedGround
{
    return self.frame.origin.y + self.frame.size.height >= [self floor];
}

- (float)floor
{
    return size.height * .9;
}

- (int)targetX {
    return onLeftSide ? (size.width*2/3) - 10 : (size.width/3) + 10;
}

- (void)positionBear
{
    int xTarget = [self targetX];
    if(!isInXPlace && self.center.x - xTarget < xPosEpsilon && xTarget - self.center.x < xPosEpsilon)
    {
        self.center = CGPointMake(xTarget, self.center.y);
        isInXPlace = true;
    }
    else
    {
        float xIncrement = ABS(self.center.x - xTarget)/xMoveInverseAcceleration;
        int xDirection = -ABS(self.center.x - xTarget)/(self.center.x - xTarget);
        self.center = CGPointMake((self.center.x + xIncrement*xDirection), self.center.y);
    }
}


- (void)plantBearOnGround {
    self.center = CGPointMake(self.center.x, [self floor] - self.frame.size.height/2);
}

- (void)applyFalling
{
    if ([self bearReachedGround])
    {
        fallSpeed = 0;
        [self plantBearOnGround];
    } else {
        self.center = CGPointMake(self.center.x, self.center.y + fallSpeed);
        fallSpeed += gravity;
        
        
        if ([self bearReachedGround])
        {
            fallSpeed = 0;
            [self plantBearOnGround];
        }
    }
}

- (void)jump
{
    if ([self bearReachedGround]) {
        onLeftSide = !onLeftSide;
        isInXPlace = false;
        fallSpeed = -jumpForce;
        self.center = CGPointMake(self.center.x, self.center.y - 1);
    }    
}

- (void)loop {
    [self positionBear];
    [self applyFalling];
}

- (void)setSize:(CGSize)s {
    size = s;
}

@end
