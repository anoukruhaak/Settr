//
//  NSMutableArray+Shuffle.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/1/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)

-(NSArray *)shuffle
{
    {
        NSUInteger count = [self count];
        
        if (count == 0) {
            return self;
        }
        
        for (int i = 0; i < count; i++) {
            int j = arc4random() % (count - 1);
            
            if (j != i) {
                [self exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
        return self;
    }
    
}

@end
