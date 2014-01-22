//
//  GameView.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/22/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "GameView.h"

@implementation GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setButtons];
    }
    return self;
}

-(void)setButtons
{
    float startPosX = 25.0;
    float startPosY = 52.5;
    float width = 100.0;
    float height = 65.0;
    float space = 10.0;
    float spaceY = 10.0;
    float offset = 0.0;
    
    
    self.bOne = [[UIButton alloc]initWithFrame:CGRectMake(startPosX, startPosY, width, height)];
    self.bTwo = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width), startPosY, width, height)];
    self.bThree = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*2, startPosY, width, height)];
    self.bFour = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*3, startPosY, width, height)];
    
    self.bFive = [[UIButton alloc]initWithFrame:CGRectMake(startPosX, startPosY + (spaceY +height), width, height)];
    self.bSix = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width), startPosY + (spaceY +height), width, height)];
    self.bSeven = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*2, startPosY + (spaceY +height) , width, height)];
    self.bEight = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*3, startPosY + (spaceY +height), width, height)];
    
    self.bNine = [[UIButton alloc]initWithFrame:CGRectMake(startPosX, startPosY + (spaceY + height)*2, width, height)];
    self.bTen = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width), startPosY + (spaceY + height)*2, width, height)];
    self.bEleven = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*2, startPosY + (spaceY + height)*2 , width, height)];
    self.bTwelve = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*3, startPosY + (spaceY + height)*2, width, height)];
    
    self.bThirteen = [[UIButton alloc]initWithFrame:CGRectMake(startPosX, startPosY + (spaceY - offset + height)*3, width, height)];
    self.bFourteen = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width), startPosY + (spaceY + -offset + height)*3 , width, height)];
    self.bFifteen = [[UIButton alloc]initWithFrame:CGRectMake(startPosX + (space + width)*2, startPosY + (spaceY - offset + height)*3, width, height)];
    
    self.buttons = @[self.bOne, self.bTwo, self.bThree, self.bFour, self.bFive, self.bSix, self.bSeven, self.bEight, self.bNine,self.bTen,self.bEleven,self.bTwelve, self.bThirteen, self.bFourteen, self.bFifteen];
    
    for (int i =0; i <15; i++){
        
        UIButton *b = [self.buttons objectAtIndex:i];
        [b addTarget:self.delegate action:@selector(selectedCard:) forControlEvents:UIControlEventTouchUpInside];
        
        b.backgroundColor = [UIColor clearColor];
        b.layer.shadowColor = [UIColor whiteColor].CGColor;
        b.layer.shadowOpacity = 0.4;
        b.layer.shadowRadius = 3;
        b.layer.shadowOffset = CGSizeMake(0.5f, 0.5f);
    }
    
    for (int i = 0; i<12; i++) {
        UIButton *b = [self.buttons objectAtIndex:i];
        [self addSubview:b];
    }
    
    
}
-(void)addThreeButtons
{
    [self addSubview:self.bThirteen];
    [self addSubview:self.bFourteen];
    [self addSubview:self.bFifteen];
}

-(void)removeThreeButtons
{
    [self.bThirteen removeFromSuperview];
    [self.bFourteen removeFromSuperview];
    [self.bFifteen removeFromSuperview];
    
}

@end
