//
//  Lightning.m
//  FlashBear
//
//  Created by quantum on 29/06/2015.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import "Lightning.h"
#import "Field.h"

@implementation Lightning

- (id)initWithFrame:(CGRect)frame field:(Field *)f {
    self = [super initWithFrame:frame];
    self.f = f;
    self.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < 23; i++) {
        bolts[i] = CGPointMake(frame.size.width / 2, -10);
    }
    
    strikingLeft = [self getDirection];

    
    return self;
}

- (bool)getDirection {
    return arc4random() % 2;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 4.0);
    
    CGPoint zaps[iterations];
    for (int i = 0; i < iterations; i++) {
        zaps[i] = CGPointMake(bolts[i].x, bolts[i].y);
    }
    
    CGContextAddLines(context, zaps, sizeof(zaps) / sizeof(zaps[0]));
    CGContextStrokePath(context);

}

- (void)strike {
    iterations++;
    
    if (iterations <= 34) {
        int direction = strikingLeft ? - 1 : 1;
        CGPoint oldBolt = bolts[iterations-1];
        int randX = arc4random() % 15;
        int randY = arc4random() % 6;
        if (iterations <= 2) {
            randX += arc4random() % 15;
            randX += 8;
        } else if (iterations <= 46) {
            randY += 6;
        }
        if (oldBolt.x > self.frame.size.width * .90) {
            randX = -randX;
        } else if (oldBolt.x < self.frame.size.width * .10) {
            randX = -randX;
        }
        bolts[iterations] = CGPointMake(oldBolt.x + (direction * randX), oldBolt.y + randY);
        
        if (iterations >= 33) {
            bool shouldStrikeBear = [self.f shouldStrikeBear:self];
            if (shouldStrikeBear) {
                bolts[iterations] = self.f.bear.center;
                [self.f thunderStruck:self];
            } else {
                bolts[iterations] = CGPointMake(oldBolt.x + (direction * randX), self.frame.size.height * .85);
            }

    //        iterations = 0;
        }
    }

    [self setNeedsDisplay];
}

- (bool)onLeft {
    return strikingLeft;
}

- (bool)struck {
    return iterations >= 34;
}

- (CGPoint)latest {
    return bolts[iterations];
}

@end
