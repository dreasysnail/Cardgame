//
//  Deck.m
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (nonatomic) NSMutableArray *cards;

@end

@implementation Deck

//initiate at application of obj
-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}



-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else{
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    if ([self.cards count]) {
        unsigned idx = arc4random()%[self.cards count];
        Card *tmpCard = self.cards[idx];
        [self.cards removeObjectAtIndex:idx];
        return tmpCard;
    }
    return nil;
}




@end
