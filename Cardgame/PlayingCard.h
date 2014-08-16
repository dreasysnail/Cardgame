//
//  PlayingCard.h
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface PlayingCard : Card

//try by default

@property NSString *suit;

@property NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
