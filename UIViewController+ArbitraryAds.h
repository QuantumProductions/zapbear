//
//  UIViewController+ArbitraryAds.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAD/iAD.h>

@interface UIViewController (ArbitraryAds) <ADBannerViewDelegate>

- (void)bannerViewActionDidFinish:(ADBannerView *)banner;
- (void)bannerViewDidLoadAd:(ADBannerView *)banner;
- (void)bannerViewWillLoadAd:(ADBannerView *)banner;
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner;
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error;
- (void)loadMoney;
- (void)hideMoney;

@property (strong, nonatomic) ADBannerView *arbitrary;

@end
