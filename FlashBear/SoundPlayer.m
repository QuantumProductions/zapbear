//
//  SoundPlayer.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "SoundPlayer.h"

@implementation SoundPlayer

- (id)init {
    self = [super init];
    [self loadSounds];
    [self.musicPlayer play];
    return self;
}

- (void)loadSounds
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"jump" ofType:@"wav"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"wav"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    self.musicPlayer.numberOfLoops = -1;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"thunder4" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    
    self.thunderPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [self.thunderPlayer play];
    
    self.thunderPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    
    self.thunderPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    
    self.thunderPlayers = @[self.thunderPlayer, self.thunderPlayer2, self.thunderPlayer3];
    thunderPlayerIndex = 0;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"preThunder3" ofType:@"wav"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    
    self.preThunderPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [self.preThunderPlayer play];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"lightning" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    
    self.lightningPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
}

- (void)playThunder {
    
    AVAudioPlayer *p = self.thunderPlayers[thunderPlayerIndex];
    [p play];
    
    thunderPlayerIndex = (thunderPlayerIndex + 1) % self.thunderPlayers.count;
}

- (void)playLightning {
    [self.lightningPlayer play];
}

@end
