//
//  Bear.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bear : UIImageView {
    CGSize size;
    bool onLeftSide;
    bool isInXPlace;
    float xPosEpsilon;
    float xMoveInverseAcceleration;
    
    float jumpForce;
    float gravity;
    float fallSpeed;
}

- (void)loop;
- (void)jump;

- (void)setSize:(CGSize)s;
- (void)plantBearOnGround;
- (void)redraw;

@end
