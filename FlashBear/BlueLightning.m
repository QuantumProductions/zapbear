//
//  BlueLightning.m
//  FlashBear
//
//  Created by quantum on 28/05/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "BlueLightning.h"

@implementation BlueLightning

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)assignColor:(CGContextRef)context {
    CGContextSetRGBStrokeColor(context, 0.0, 0.2, 0.78, 1.0);
}


- (bool)expert {
    return true;
}

@end
