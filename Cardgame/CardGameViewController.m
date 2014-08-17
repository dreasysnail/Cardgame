//
//  CardGameViewController.m
//  Cardgame
//
//  Created by Yizhe on 14-8-15.
//  Copyright (c) 2014年 Duke. All rights reserved.
//

#import "CardGameViewController.h"

#import "PlayingCardDeck.h"

#import "CardMatchingGame.h"

@interface CardGameViewController ()

//private

@property (strong,nonatomic) CardMatchingGame *game;
// do not change the name!!!
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;//no order
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] init:[self.cardButton count] usingDesk:[[PlayingCardDeck alloc] init]];
    return _game;
}



- (IBAction)touchcardButton:(UIButton *)sender {
//    if ([sender.currentTitle length]!=0){
//        UIImage *cardImage = [UIImage imageNamed:@"duke_sm"];
//        [sender setBackgroundImage:cardImage forState:UIControlStateNormal]; //normal state
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    }else{
//        Card *rdmCard = [self.deck drawRandomCard];
//        if (rdmCard) {
//            [sender setBackgroundImage:[UIImage imageNamed:@"duke_f_sm"] forState:UIControlStateNormal]; //normal state
//            [sender setTitle:rdmCard.contents forState:UIControlStateNormal];
//            self.flipCount++;
//        }
//    }

    int chosenButtonIndex = [self.cardButton indexOfObject:sender];
    [self.game ChooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButton) {
        int cardButtonIndex = [self.cardButton indexOfObject:cardButton];
        Card *card = [self.game CardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

//no need to declare
- (NSString *)titleForCard:(Card *)card{
    return card.isChosen? card.contents: @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen? @"duke_f_sm":@"duke_sm"];
}


@end
