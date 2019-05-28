//
//  Scorer.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scorer : NSObject {
    int milliseconds;
    int seconds;
}

- (void)loop;
- (void)reset;

- (NSInteger)points;
- (bool)advanced;
- (bool)expert;

@end
