//
//  PlayingCard.m
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents
{
    //return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;  // because we provide setter AND getter


//class method
+ (NSArray *)validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

//make it private
+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",,@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }
//instance method - ; class method +;
- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


-(NSString *)suit{
    //if suit == nil
    return _suit?_suit:@"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}



@end
