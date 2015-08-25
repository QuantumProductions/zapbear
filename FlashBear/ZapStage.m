//
//  ZapStage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "ZapStage.h"

@implementation ZapStage

- (void)activate {
    self.lightning = [[Lightning alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.lightning];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)zapLoop {
    [self.lightning strike];
}


@end
