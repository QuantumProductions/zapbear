//
//  Scorer.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Scorer.h"

@implementation Scorer

//- (void)lightningStrikesBear {
//    NSInteger bearDeaths = [[NSUserDefaults standardUserDefaults] integerForKey:@"strikes"];
//    bearDeaths++;
//    [[NSUserDefaults standardUserDefaults] setInteger:bearDeaths forKey:@"strikes"];
//    
//    NSInteger lightning = [[NSUserDefaults standardUserDefaults] integerForKey:@"lightning"];
//    lightning+= lightnings;
//    lightnings = 0;
//    [[NSUserDefaults standardUserDefaults] setInteger:lightning forKey:@"lightning"];
//    
//    NSInteger savedBest = [[NSUserDefaults standardUserDefaults] integerForKey:@"best"];
//    if (best >= savedBest) {
//        [[NSUserDefaults standardUserDefaults] setInteger:best forKey:@"best"];
//    }
//    
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    self.label.text = [NSString stringWithFormat:@"%d", points];
//    self.label.font = [UIFont boldSystemFontOfSize:24];
//    
//    displayTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"total"];
//    [self showMenu:points];
//    NSInteger actualTotal = displayTotal;
//    for (int i = points; i > 0; i--) {
//        actualTotal += i;
//    }
//    
//    self.bestLabel.text = [NSString stringWithFormat:@"Best %ld", (long)best];
//    self.highscoreLabel.text = [NSString stringWithFormat:@"ϟ %ld", (long)displayTotal];
//    
//    self.bestLabel.alpha = 1;
//    self.highscoreLabel.alpha = 1;
//    
//    [[NSUserDefaults standardUserDefaults] integerForKey:@"total"];
//    
//    state = ThunderStruck;
//    [self animateTitle];
//    bearHasBeenHitOnce = true;
//    
//    __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
//    self.scoresToReport = [self scores];
//    
//    if (localPlayer.isAuthenticated) {
//        [self reportScores];
//    } else {
//        [self authenticateLocalPlayer];
//    }
//}

//- (void)scorePoint
//{
//    points++;
//    if (points > best) {
//        best = points;
//    }
//}


- (void)loop {
    milliseconds += 16;
    if (milliseconds > 1000) {
        milliseconds -= 1000;
        seconds++;
    }
}
- (void)reset {
    milliseconds = 0;
    seconds = 0;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%ld pts", (long)[self points]];
}

- (NSInteger)points {
    return (seconds * 1000) + milliseconds;
}

- (bool)advanced {
    return seconds > 60;
}

- (bool)expert {
    return seconds > 120;
}


@end
