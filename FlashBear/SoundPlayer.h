//
//  SoundPlayer.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundPlayer : NSObject {
        int thunderPlayerIndex;
}

@property (strong, nonatomic) AVAudioPlayer *thunderPlayer;
@property (strong, nonatomic) AVAudioPlayer *thunderPlayer2;
@property (strong, nonatomic) AVAudioPlayer *thunderPlayer3;
@property (strong, nonatomic) NSArray *thunderPlayers;
@property (strong, nonatomic) AVAudioPlayer *preThunderPlayer;
@property (strong, nonatomic) AVAudioPlayer *lightningPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *musicPlayer;

- (void)playThunder;
- (void)playLightning;

@end
