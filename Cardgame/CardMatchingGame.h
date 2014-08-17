//
//  CardMatchingGame.h
//  Cardgame
//
//  Created by Yizhe on 14-8-16.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype) init: (NSInteger) count
                        usingDesk:(Deck *)deck;

-(void) ChooseCardAtIndex: (NSInteger) idx;

-(Card *) CardAtIndex: (NSInteger) idx;

@property (nonatomic,readonly) int score;  // readonly for public readwrite for private

@end
