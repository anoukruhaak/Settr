//
//  CardView.m
//  Set
//
//  Created by Anouk Ruhaak on 1/1/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "CardView.h"



@implementation CardView

-(id)initWithColor:(NSString *)color Pattern:(NSString *)pattern Number:(NSString *)number Symbol:(NSString *)symbol
{
    self=[super init];
    if (self) {
        
        //Set the properties
        self.color=color;
        self.symbol=symbol;
        self.pattern=pattern;
        
        //Create box for the main layer
   
        //CGColorRef backgroundColor = [UIColor colorWithRed:255.0/255.0 green:250.0/255.0 blue:240.0/255.0 alpha:1.0].CGColor;

        CGRect boxShape = CGRectMake(0, 0, 100, 65);
        self.frame=boxShape;
        self.backgroundColor=[UIColor whiteColor].CGColor;
        self.cornerRadius = 8.0f;
        self.masksToBounds = NO;
        self.borderWidth = 0.2f;
        self.borderColor = [UIColor grayColor].CGColor;
        
        self.shadowColor = [UIColor clearColor].CGColor;
        self.shadowOpacity = 0.2;
        self.shadowRadius = 3;
        self.shadowOffset = CGSizeMake(0.0f, 0.0f);
        
        
        self.sublayer1=[CAShapeLayer layer];
        self.sublayer2=[CAShapeLayer layer];
        self.sublayer3=[CAShapeLayer layer];
        self.sublayer1.backgroundColor=[UIColor clearColor].CGColor;
        self.sublayer2.backgroundColor=[UIColor clearColor].CGColor;
        self.sublayer3.backgroundColor=[UIColor clearColor].CGColor;
        self.sublayer1.lineWidth=1.5;
        self.sublayer2.lineWidth=1.5;
        self.sublayer3.lineWidth=1.5;
    
        
        //Every sublayer
        float height = self.bounds.size.height;
        float width = (self.bounds.size.width -10)/3;
        
        if ([number isEqualToString:@"One"]) {
            self.sublayer1.frame = CGRectMake(5+width, 0, width, height);
            [self setLayer:self.sublayer1];
            
            
        }else if ([number isEqualToString:@"Two"]) {
            self.sublayer1.frame = CGRectMake(5+width/2, 0, width, height);
            self.sublayer2.frame = CGRectMake(5+ width/2 + width, 0, width, height);
            [self setLayer:self.sublayer1];
            [self setLayer:self.sublayer2];
            
        
        }else{
            self.sublayer1.frame = CGRectMake(5, 0, width, height);
            self.sublayer2.frame =CGRectMake(5+width,0, width, height);
            self.sublayer3.frame = CGRectMake(5+ width*2, 0, width, height);
            [self setLayer:self.sublayer1];
            [self setLayer:self.sublayer2];
            [self setLayer:self.sublayer3];

        }
    }
    
    return self;
}

-(void)setLayer: (CAShapeLayer *)layer
{
    if ([self.symbol isEqualToString:@"Circle"]) {
        [self createCircleForLayer:layer];
    }else if ([self.symbol isEqualToString:@"Square"]){
        [self createSquareForLayer:layer];
    }else{
        [self createTriangleForLayer:layer];
    }
    
    
    if ([self.color isEqualToString:@"Red"]) {
        layer.strokeColor = [UIColor colorWithRed:255.0/255.0 green:97.0/255.0 blue:3.0/255.0 alpha:1.0].CGColor;
    }else if ([self.color isEqualToString:@"Green"]){
        layer.strokeColor =[UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1.0].CGColor;
    }else{
        layer.strokeColor =[UIColor colorWithRed:238.0f/255.0f green:48.0f/255.0f blue:167.0/255.0 alpha:1.0].CGColor;
;
    }
    
    if ([self.pattern isEqualToString:@"Fill"]) {
        layer.fillColor=layer.strokeColor;
    }else if ([self.pattern isEqualToString:@"Empty"]){
        layer.fillColor=[UIColor clearColor].CGColor;
    }else{
        CGColorRef color = CGColorCreateCopyWithAlpha(layer.strokeColor, 0.2);
        layer.fillColor= color;
        CGColorRelease(color);
    }
    
    [self addSublayer:layer];
}


-(void)createCircleForLayer: (CAShapeLayer *)layer
{
    CGMutablePathRef circle = CGPathCreateMutable();
    CGPathAddEllipseInRect(circle, nil, CGRectInset(layer.bounds, 2, 19));
    layer.path=circle;
    CGPathRelease(circle);

    
}

-(void)createSquareForLayer: (CAShapeLayer *)layer
{
    CGMutablePathRef square = CGPathCreateMutable();
    CGPathAddRect(square, nil, CGRectInset(layer.bounds, 5, 16));
    layer.path=square;
    CGPathRelease(square);
}

-(void)createTriangleForLayer: (CAShapeLayer *)layer
{
    
    CGMutablePathRef triangle = CGPathCreateMutable();
    
    CGRect myRect = CGRectInset(layer.bounds, 3, 19);
    CGPathMoveToPoint (triangle, nil, CGRectGetMinX(myRect), CGRectGetMaxY(myRect));
    
    // add bottom edge
    CGPathAddLineToPoint (triangle, nil, CGRectGetMaxX(myRect), CGRectGetMaxY(myRect));
    
    // add right edge
    CGPathAddLineToPoint (triangle, nil, (myRect.size.width/2 +myRect.origin.x), CGRectGetMinY(myRect));
                          
    // add top edge
    //CGPathAddLineToPoint (triangle, nil, CGRectGetMinX(myRect), CGRectGetMaxY(myRect));
                          
    // add left edge and close
    CGPathCloseSubpath (triangle);

    //CGPathAddRect(square, nil, CGRectInset(layer.bounds, 4, 20));
    
    layer.path=triangle;
    CGPathRelease(triangle);

}


@end
