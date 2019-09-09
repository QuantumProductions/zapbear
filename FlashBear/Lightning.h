//
//  Lightning.h
//  FlashBear
//
//  Created by quantum on 29/06/2015.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lightning : UIView {
    int iterations;
    CGPoint bolts[34];
    float drawWidth;
    bool strikingLeft;
}

@property (nonatomic) float x;

- (void)strike;

- (bool)onLeft;
- (bool)struck;

- (CGPoint)latest;

- (bool)getDirection;

- (void)incrementIterations;

- (void)assignColor:(CGContextRef)context;

- (bool)advanced;
- (bool)expert;
- (bool)adept;

@end
