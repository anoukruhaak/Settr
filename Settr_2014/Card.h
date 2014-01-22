//
//  Card.h
//  Set
//
//  Created by Anouk Ruhaak on 12/31/13.
//  Copyright (c) 2013 Djipsy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CardView;

@interface Card : NSObject

{
    
}

@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *pattern;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) CardView *cardLayer;


-(id)initWithColor:(NSString *)color Number:(NSString *)number Pattern: (NSString *)pattern Symbol:(NSString*)symbol;

@end
