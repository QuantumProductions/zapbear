//
//  Lightning.m
//  FlashBear
//
//  Created by quantum on 29/06/2015.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import "Lightning.h"

@implementation Lightning

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    
    
    for (int i = 0; i < 23; i++) {
        bolts[i] = CGPointMake(frame.size.width / 2, -10);
    }
    
    bolts[0] = CGPointMake(self.x, -2);

    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    CGContextAddLines(context, bolts, sizeof(bolts)/sizeof(bolts[0]));
    CGContextStrokePath(context);

}

- (void)pulse
{
    iterations++;
    
    if (iterations < 23) {
    CGPoint oldBolt = bolts[iterations-1];
    int randX = arc4random() % 10;
    int randY = arc4random() % 20;
    randY += 10;
    int flip = arc4random() % 2;
    if (flip) {
        randX = -randX;
    }
    bolts[iterations] = CGPointMake(oldBolt.x + randX, oldBolt.y + randY);
    } else if (iterations == 23) {
        bolts[22] = CGPointMake(self.x, self.frame.size.height);
    }

    [self setNeedsDisplay];
}

- (void)reset {
    iterations = 0;
    for (int i = 0; i < 23; i++) {
        bolts[i] = CGPointMake(self.x, -10);
    }
}

- (bool)struck {
    return iterations >= 23;
}

@end
