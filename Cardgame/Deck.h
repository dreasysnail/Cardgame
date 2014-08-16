//
//  Deck.h
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Deck : NSObject
//why add attop:

//why - private??
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;


@end
