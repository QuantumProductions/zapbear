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

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self addObserver:self forKeyPath:@"f" options:NSKeyValueObservingOptionNew context:nil];

    
    self.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < 23; i++) {
        bolts[i] = CGPointMake(frame.size.width / 2, -10);
    }
    
    strikingLeft = [self getDirection];
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
}

- (bool)getDirection {
    return arc4random() % 2;
}

- (void)assignColor:(CGContextRef)context {
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self assignColor:context];
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 4.0);
    
    CGPoint zaps[iterations];
    for (int i = 0; i < iterations; i++) {
        zaps[i] = CGPointMake(bolts[i].x, bolts[i].y);
    }
    
    CGContextAddLines(context, zaps, sizeof(zaps) / sizeof(zaps[0]));
    CGContextStrokePath(context);
}

- (void)incrementIterations {
    iterations++;
}

- (void)strike {
    [self incrementIterations];
    
    if (iterations <= 36) {
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
        
        if (iterations >= 35) {
            bool shouldStrikeBear = [[Field shared] shouldStrikeBear:self];
            if (shouldStrikeBear) {
                bolts[iterations] = [Field shared].bear.center;
                [[Field shared] thunderStruck:self];
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
    return iterations >= 36;
}

- (CGPoint)latest {
    return bolts[iterations];
}

- (bool)advanced {
    return false;
}

- (bool)expert {
    return false;
}

- (bool)adept {
    return false;
}

- (bool)adroit {
    return false;
}

@end
