//
//  Card.m
//  Set
//
//  Created by Anouk Ruhaak on 12/31/13.
//  Copyright (c) 2013 Djipsy. All rights reserved.
//

#import "Card.h"
#import "CardView.h"

@implementation Card

-(id)initWithColor:(NSString *)color Number:(NSString *)number Pattern:(NSString *)pattern Symbol:(NSString *)symbol
{
    self=[super init];
    if (self) {
        self.color=color;
        self.number=number;
        self.pattern=pattern;
        self.symbol=symbol;
        
        CardView *card = [[CardView alloc]initWithColor:color Pattern:pattern Number:number Symbol:symbol];
        self.cardLayer=card;
    }
    
    return self;
}
@end
