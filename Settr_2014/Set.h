//
//  Set.h
//  Set
//
//  Created by Anouk Ruhaak on 12/31/13.
//  Copyright (c) 2013 Djipsy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Set : NSObject

{
    
}

@property (nonatomic, strong) NSArray *cards;

- (BOOL)checkTotalForCardOne:(Card *)cOne Two:(Card *)cTwo Three: (Card *)cThree;
- (BOOL)setInArray: (NSMutableArray *)array;

@end
