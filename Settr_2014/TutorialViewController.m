//
//  TutorialViewController.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/9/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "TutorialViewController.h"
#import "CardView.h"

@interface TutorialViewController ()
{
    UILabel *instructionLabelUp;
    UILabel *instructionLabelDown;
    
    int count;

    CardView *cardOne;
    CardView *cardTwo;
    CardView *cardThree;
    CardView *cardFour;
    CardView *cardFive;
    CardView *cardSix;
    
    NSArray *cardsUp;
    NSArray *cardsDown;
    
    UIColor *pink;
    
}

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    count=0;
    
    pink = kPink2;
    UIColor *pink2 = kPink3;
    
    [self setCards];
    self.title = @"Tutorial";

    self.view.backgroundColor = pink2;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = pink;
    self.navigationController.navigationBar.tintAdjustmentMode=UIViewTintAdjustmentModeAutomatic;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(pressedNext)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}


-(void)setCards
{
    float startPosX = 75.0;
    float startPosY = 110.0;
    float width = 100.0;
    float height = 65.0;
    float space = 10.0;
    float spaceY = 50.0;
    
    instructionLabelUp = [[UILabel alloc]initWithFrame:CGRectMake(startPosX, startPosY-45, 300, 40)];
    instructionLabelUp.backgroundColor = [UIColor clearColor];
    instructionLabelUp.textColor = pink;
    instructionLabelUp.text = [NSString stringWithFormat:@"This tutorial..."];
    instructionLabelUp.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0];
    [self.view addSubview:instructionLabelUp];
    
    instructionLabelDown = [[UILabel alloc]initWithFrame:CGRectMake(startPosX, startPosY-45 + height +spaceY, 300, 40)];
    instructionLabelDown.backgroundColor = [UIColor clearColor];
    instructionLabelDown.textColor = pink;
    instructionLabelDown.text = [NSString stringWithFormat:@"... Is a work in progress :-)"];
    instructionLabelDown.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0];
    [self.view addSubview:instructionLabelDown];
    
    cardOne = [[CardView alloc]initWithColor:@"Green" Pattern:@"Dot" Number:@"One" Symbol:@"Square"];
    cardOne.frame = CGRectMake(startPosX, startPosY, width, height);
    cardTwo = [[CardView alloc]initWithColor:@"Green" Pattern:@"Empty" Number:@"One" Symbol:@"Circle"];
    cardTwo.frame =  CGRectMake(startPosX + (space + width), startPosY, width, height);
    cardThree = [[CardView alloc]initWithColor:@"Green" Pattern:@"Fill" Number:@"Two" Symbol:@"Square"];
    cardThree.frame = CGRectMake(startPosX + (space + width)*2, startPosY, width, height);
    
    cardFour = [[CardView alloc]initWithColor:@"Green" Pattern:@"Dot" Number:@"One" Symbol:@"Square"];
    cardFour.frame = CGRectMake(startPosX, startPosY + (spaceY +height), width, height);
    cardFive =  [[CardView alloc]initWithColor:@"Red" Pattern:@"Fill" Number:@"One" Symbol:@"Circle"];
    cardFive.frame = CGRectMake(startPosX + (space + width), startPosY + (spaceY +height), width, height);
    cardSix = [[CardView alloc]initWithColor:@"Purple" Pattern:@"Empty" Number:@"Two" Symbol:@"Square"];
    cardSix.frame = CGRectMake(startPosX + (space + width)*2, startPosY + (spaceY +height) , width, height);
    
    cardsUp = @[cardOne, cardTwo, cardThree];
    cardsDown = @[cardFour, cardFive, cardSix];
    
    for (int i = 0; i <3; i++) {
        [self.view.layer addSublayer:[cardsUp objectAtIndex:i]];
        [self.view.layer addSublayer:[cardsDown objectAtIndex:i]];
    }
}

-(void)pressedNext
{
    //Move to next tutorial view.
}

-(void)dealloc
{
    instructionLabelUp=nil;
    instructionLabelDown=nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
