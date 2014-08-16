//
//  Card.h
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject


@property (strong,nonatomic) NSString *contents;
//strong default
@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;


@end
