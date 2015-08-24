//
//  Stage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Stage.h"
#import "Field.h"

@implementation Stage

- (void)activate {
    
}

- (id)initWithField:(Field *)field {
    self = [super init];
    self.f = field;
    [self activate];
    return self;
}

- (void)zapLoop {
    
}

- (void)bearLoop {
    [self.bear loop];
}

- (Bear *)bear {
    return self.f.bear;
}

- (void)loop {
    [self zapLoop];
    [self bearLoop];
}

- (UIViewController *)vc {
    return self.f.vc;
}

@end
