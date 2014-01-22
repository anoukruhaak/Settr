//
//  ScoreViewController.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/22/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "ScoreViewController.h"
#import "GameButton.h"
#import "GameLabels.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

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
    
    UIColor *pink3 = kPink3;
    UIColor *pink2 = kPink2;
    UIColor *pink = kPink;
    UIColor *green2 = kGreen2;
    UIColor *green = kGreen;
    UIColor *orange = kOrange;
    UIColor *orange2 = kOrange2;
    UIColor *lightText = kLightText;

    self.view.backgroundColor = pink3;
    
    GameButton *menu = [[GameButton alloc]initWithFrame:CGRectMake(25, 10, 70, 30) backgroundColor:green borderColor:green textColorOne:green textColorTwo:green2];
    [menu setTitle:@"Menu" forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(goToMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menu];
    
    GameButton *newGame = [[GameButton alloc]initWithFrame:CGRectMake(370, 10, 80, 30) backgroundColor:orange borderColor:orange textColorOne:orange textColorTwo:orange2];
    [newGame setTitle:@"New Game" forState:UIControlStateNormal];
    [newGame addTarget:self action:@selector(startNewGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGame];
    
    GameLabels *scoreText = [[GameLabels alloc]initWithFrame:CGRectMake(self.view.frame.size.height/2-150, self.view.frame.size.width/2-90, 300, 200) andColor:pink andColor:pink textColor:lightText fontSize:16.0];
    scoreText.numberOfLines=0;
    scoreText.text = self.scoreString;
    [self.view addSubview:scoreText];
    
}


//------------------------------------------Move to other screens --------------------------------------

-(void)goToMenu
{
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{[self.navigationController popToRootViewControllerAnimated:NO];
    } completion:nil];
    
}

-(void)startNewGame
{
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{[self.navigationController popViewControllerAnimated:NO];
    } completion:nil];

}


//------------------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
