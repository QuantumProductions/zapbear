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

- (void)strike {
    int flip = self.x < self.frame.size.width / 2;
    bolts[0] = CGPointMake(flip ? self.frame.size.width * .45 : self.frame.size.width * .55, -2);
    for (iterations = 1; iterations < 22; iterations++) {
        flip = self.x < self.frame.size.width / 2;
        CGPoint oldBolt = bolts[iterations-1];
        int randX = arc4random() % 15;
        int randY = arc4random() % 5;
        randY += 10;
        if (oldBolt.x > self.frame.size.width * .90) {
            randX = -randX;
        } else if (oldBolt.x < self.frame.size.width * .10) {
            randX = randX;
        } else {
            if (flip) {
                randX = -randX;
            }
        }
        
        bolts[iterations] = CGPointMake(oldBolt.x + randX, oldBolt.y + randY);
    }
    bolts[22] = CGPointMake(self.x, self.frame.size.height - 50);
    [self setNeedsDisplay];
}


@end
