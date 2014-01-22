//
//  Set.m
//  Set
//
//  Created by Anouk Ruhaak on 12/31/13.
//  Copyright (c) 2013 Djipsy. All rights reserved.
//

#import "Set.h"
#import "Card.h"
#import "CardView.h"
#import "NSMutableArray+Shuffle.h"

@implementation Set

-(id)init
{
    self=[super init];
    if (self) {
        
        [self loadCards];
    }
    
    return self;
}

-(void)loadCards
{
   
    NSMutableArray *colors = [[NSMutableArray alloc]init];
    NSArray *numbers = @[@"One", @"Two", @"Three"];
    NSMutableArray *patterns = [[NSMutableArray alloc]init];
    NSMutableArray *symbols = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 27; i++) {
        NSString *color = @"Red";
        [colors addObject:color];
        
        if (i < 9){
            NSString *pattern =@"Fill";
            [patterns addObject:pattern];
        }
        
        if (i < 3) {
            NSString *symbol = @"Square";
            [symbols addObject:symbol];
            
        }
    }
    
    
    for (int i = 0; i < 27; i++) {
        NSString *color = @"Green";
        [colors addObject:color];
        
        if (i < 9){
            NSString *pattern =@"Empty";
            [patterns addObject:pattern];
        }
        
        if (i < 3) {
            NSString *symbol = @"Circle";
            [symbols addObject:symbol];
            
        }
    }

    
    for (int i = 0; i < 27; i++) {
        NSString *color = @"Purple";
        [colors addObject:color];
        
        if (i < 9){
            NSString *pattern =@"Dot";
            [patterns addObject:pattern];
        }
        
        if (i < 3) {
            NSString *symbol = @"Triangle";
            [symbols addObject:symbol];
            
        }
    }
    
    NSMutableArray *cards =[[NSMutableArray alloc]init];
    
    for (int i = 0 ; i <81; i++) {
        Card *c = [[Card alloc]init];
        c.number = [numbers objectAtIndex:i%3];
        c.symbol = [symbols objectAtIndex:i%9];
        c.pattern = [patterns objectAtIndex:i%27];
        c.color = [colors objectAtIndex:i];
        
        CardView *cv = [[CardView alloc]initWithColor:c.color Pattern:c.pattern Number:c.number Symbol:c.symbol];
        c.cardLayer=cv;
        
        [cards addObject:c];
    }
    
    
    self.cards = [[NSArray alloc]initWithArray:[cards shuffle]];
}


-(BOOL)checkCardOne:(NSString *)cOne Two:(NSString *)cTwo Three:(NSString *)cThree
{
    if ([cOne isEqualToString:cTwo] && [cOne isEqualToString: cThree]) {
        return TRUE;
    
    } else if (![cOne isEqualToString:cTwo] && ![cOne isEqualToString: cThree] && ![cTwo isEqualToString: cThree]) {
        return TRUE;
    
    }else{
        return FALSE;
    }

}


- (BOOL)checkTotalForCardOne:(Card *)cOne Two:(Card *)cTwo Three: (Card *)cThree
{
    BOOL color = [self checkCardOne:cOne.color Two:cTwo.color Three:cThree.color];
    BOOL number = [self checkCardOne:cOne.number Two:cTwo.number Three:cThree.number];
    BOOL pattern = [self checkCardOne:cOne.pattern Two:cTwo.pattern Three:cThree.pattern];
    BOOL symbol = [self checkCardOne:cOne.symbol Two:cTwo.symbol Three:cThree.symbol];
    
    if (color==TRUE && number==TRUE && pattern==TRUE && symbol==TRUE) {
        return TRUE;
    }else{
        return FALSE;
    }
    
}

- (void)findAllSetsInArray: (NSArray *)array
{
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
    
    
    while (array1.count>0) {
        Card *c = [array1 objectAtIndex:0];
        NSMutableArray *array2 = [[NSMutableArray alloc]initWithArray:array1];
        [array2 removeObject:[array1 objectAtIndex:0]];
        
        while (array2.count>0){
            Card *d = [array2 objectAtIndex:0];
            NSMutableArray *array3 = [[NSMutableArray alloc]initWithArray:array2];
            [array3 removeObject:[array2 objectAtIndex:0]];
        
            while (array3.count>0){
                Card *e = [array3 objectAtIndex:0];
                if ([self checkTotalForCardOne:c Two:d Three:e]==TRUE) {
                    NSLog(@"SET: %@, %@, %@, %@, with %@, %@, %@, %@ and %@, %@, %@, %@", c.color,c.number,c.pattern,c.symbol,d.color,d.number,d.pattern,d.symbol,e.color,e.number,e.pattern, e.symbol);
                }else {
                }
                [array3 removeObject:e];
            }
            [array2 removeObject:d];
        }
        
        [array1 removeObject:c];
    }
    
}

-(BOOL)setInArray: (NSMutableArray *)array
{
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
    BOOL succes = FALSE;
    
    while ((array1.count>0) && (succes ==FALSE)){
        Card *c = [array1 objectAtIndex:0];
        NSMutableArray *array2 = [[NSMutableArray alloc]initWithArray:array1];
        [array2 removeObject:[array1 objectAtIndex:0]];
        
        while ((array2.count>0)&& (succes ==FALSE)){
            Card *d = [array2 objectAtIndex:0];
            NSMutableArray *array3 = [[NSMutableArray alloc]initWithArray:array2];
            [array3 removeObject:[array2 objectAtIndex:0]];
            
            while ((array3.count>0)&& (succes ==FALSE)){
                Card *e = [array3 objectAtIndex:0];
                if ([self checkTotalForCardOne:c Two:d Three:e]==TRUE) {
                     NSLog(@"SET: %@, %@, %@, %@, with %@, %@, %@, %@ and %@, %@, %@, %@", c.color,c.number,c.pattern,c.symbol,d.color,d.number,d.pattern,d.symbol,e.color,e.number,e.pattern, e.symbol);
                    succes = TRUE;
                }else {
                }
                [array3 removeObject:e];
            }
            [array2 removeObject:d];
        }
        
        [array1 removeObject:c];
    }

    return succes;
}

@end
