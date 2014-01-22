//
//  CardView.h
//  Set
//
//  Created by Anouk Ruhaak on 1/1/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//



@interface CardView : CAShapeLayer
{
    
}

@property (nonatomic, strong) CAShapeLayer *sublayer1;
@property (nonatomic, strong) CAShapeLayer *sublayer2;
@property (nonatomic, strong) CAShapeLayer *sublayer3;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *pattern;
@property (nonatomic, strong) NSString *symbol;

-(id)initWithColor:(NSString *)color Pattern:(NSString *)pattern Number:(NSString *)number Symbol:(NSString *)symbol;

@end
