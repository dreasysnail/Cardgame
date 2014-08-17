//
//  CardMatchingGame.m
//  Cardgame
//
//  Created by Yizhe on 14-8-16.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic,readwrite) int score;

@property (nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc]  init];
    return _cards;
}

-(instancetype)init: (NSInteger) count
                        usingDesk:(Deck *)deck{
    self = [super init]; //why?? super's designated initializer
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;  //why?
                break;       //
            }

        }
    }
    return self;
}

- (Card *)CardAtIndex:(NSInteger)idx{
    return self.cards[idx];
}

//add a static variable
static const int MISMATCH_PENALTY =-2;

static const int MATCH_BONUS = 4;

static const int  COST_TO_CHOOSE = -1;


-(void) ChooseCardAtIndex: (NSInteger) idx{
    Card *card = [self CardAtIndex:idx];
    if (!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO; //toggle chosen state
        } else{
            // match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]]; //why make array
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
        
                    }else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end
