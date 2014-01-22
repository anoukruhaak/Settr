//
//  MenuViewController.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/9/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "TutorialViewController.h"
#import "GameButton.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
	//[self.navigationController setNavigationBarHidden:YES];
    
    UIColor *orange = kOrange;
    UIColor *pink = kPink;
    UIColor *orange2 = kOrange2;
    UIColor *pink2 = kPink2;
    UIColor *pink3 = kPink3;
    
    UIColor *lightText = [UIColor lightTextColor];
    
    [self.view setBackgroundColor:pink3];
    
    UIButton *newGame = [[ GameButton alloc]initWithFrame:CGRectMake(self.view.frame.size.height/2-100, self.view.frame.size.width/2-100, 200, 60) backgroundColor:orange2 borderColor:orange2 textColorOne:pink2 textColorTwo:lightText];
    [newGame setTitle:@"Standard Game" forState:UIControlStateNormal];
    newGame.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    [newGame addTarget:self action:@selector(newGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGame];
    
    UIButton *newGameRace = [[GameButton alloc]initWithFrame:CGRectMake(self.view.frame.size.height/2-100, self.view.frame.size.width/2-30, 200, 60) backgroundColor:orange borderColor:orange textColorOne:orange textColorTwo:orange2];
    [newGameRace setTitle:@"Speed Game" forState:UIControlStateNormal];
    newGameRace.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    [newGameRace addTarget:self action:@selector(newGameRace) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGameRace];
    
    UIButton *tutorial = [[GameButton alloc]initWithFrame:CGRectMake(self.view.frame.size.height/2-100, self.view.frame.size.width/2+60, 200, 40) backgroundColor:pink borderColor:pink textColorOne:pink2 textColorTwo:pink2];
    [tutorial setTitle:@"Tutorial" forState:UIControlStateNormal];
    tutorial.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    [tutorial addTarget:self action:@selector(startTutorial) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tutorial];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}


-(void)newGame
{

    GameViewController *gameVC = [[GameViewController alloc]init];
    gameVC.race=FALSE;
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[[self navigationController]pushViewController:gameVC animated:NO];} completion:nil];
}

-(void)newGameRace
{
    GameViewController *gameVC = [[GameViewController alloc]init];
    gameVC.race=TRUE;
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[[self navigationController]pushViewController:gameVC animated:NO];} completion:nil];
}

-(void)startTutorial
{
    TutorialViewController *tutVC = [[TutorialViewController alloc]init];
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{[[self navigationController]pushViewController:tutVC animated:NO];} completion:nil];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
