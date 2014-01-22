//
//  GameViewController.m
//  Set
//
//  Created by Anouk Ruhaak on 1/1/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "GameViewController.h"
#import "GameLabels.h"
#import "GameButton.h"
#import "MenuViewController.h"
#import "ScoreViewController.h"
#import "CardView.h"
#import "Set.h"
#import "Card.h"

@interface GameViewController ()

{
    UIButton *checkSet;
    NSUInteger cardOne;
    NSUInteger cardTwo;
    NSUInteger cardThree;
    int numberSelected;
    int numberOfSets;
    UILabel *scoreLabel;
    UILabel *notify;

    BOOL specialMode;
    
    int counter;
    NSTimer *timer;
    UILabel *timerLabel;
    
    GameView *myGameView;
    
}


@property (nonatomic, strong) NSMutableArray *cards;



@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// ------------------------------------------ Set up the game -------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    //GameLogic:
    specialMode = FALSE;
    numberOfSets = 0;
    
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
    myGameView = [[GameView alloc]initWithFrame:frame];
    
    [self.view addSubview:myGameView];
    
    UIColor *pink3 = kPink3;
    UIColor *pink2 = kPink2;
    UIColor *pink = kPink;
    UIColor *green2 = kGreen2;
    UIColor *green = kGreen;
    UIColor *orange = kOrange;
    UIColor *orange2 = kOrange2;
    UIColor *lightText = kLightText;
    
    self.view.backgroundColor = pink3;
    
    UIButton *menu = [[GameButton alloc]initWithFrame:CGRectMake(25, 10, 70, 30) backgroundColor:green borderColor:green textColorOne:green textColorTwo:green2];
    [menu setTitle:@"Menu" forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(goToMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menu];
    
    UIButton *newGame = [[GameButton alloc]initWithFrame:CGRectMake(380, 10, 70, 30) backgroundColor:orange borderColor:orange textColorOne:orange textColorTwo:orange2];
    [newGame setTitle:@"Reset" forState:UIControlStateNormal];
    [newGame addTarget:self action:@selector(setGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGame];
    
    //Button checks whether there is a possible set
    checkSet = [[GameButton alloc]initWithFrame:CGRectMake(300, 280, 70, 30) backgroundColor:orange borderColor:orange textColorOne:orange textColorTwo:orange2];
    [checkSet setTitle:@"No Set" forState:UIControlStateNormal];
    [checkSet addTarget:self action:@selector(isThereASet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkSet];
    
    timerLabel = [[GameLabels alloc]initWithFrame:CGRectMake(190, 280, 100, 30) andColor:[UIColor clearColor] andColor:pink textColor:pink2 fontSize:14.0];
    if (self.race) {
        timerLabel.layer.borderWidth=2.5;
    }
    [self.view addSubview:timerLabel];
    
    scoreLabel = [[GameLabels alloc]initWithFrame:CGRectMake(110, 280 , 70, 30) andColor:pink andColor:pink textColor:pink2 fontSize:14.0];
    scoreLabel.text = [NSString stringWithFormat:@"Sets: %i", numberOfSets];
    [self.view addSubview:scoreLabel];

    
    //Set up a label that will enter the screen from above in case of notifications
    notify = [[GameLabels alloc]initWithFrame:CGRectMake(self.view.frame.size.height/2-60, -20, 120, 40) andColor:[[UIColor redColor]colorWithAlphaComponent:0.8] andColor:[[UIColor redColor]colorWithAlphaComponent:0.8] textColor:[lightText colorWithAlphaComponent:0.8] fontSize:16.0];
    notify.userInteractionEnabled = YES;
 
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setGame];
}


-(void)setGame
{
    //Reset score
    numberSelected =0;
    numberOfSets = 0;
    scoreLabel.text = [NSString stringWithFormat:@"Sets: %i", numberOfSets];
    
    //Restart timer and update label
    counter = 0;
    [timer invalidate];
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0/1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    timerLabel.text = [self convertTimer:counter];
    
    //Get new set of cards
    Set *mySet = [[Set alloc]init];
    self.cards=nil;
    self.cards = [[NSMutableArray alloc]initWithArray:mySet.cards];
    
    if (specialMode) {
        [self shiftButtonsUp:NO];
    }
    
    for (int i =0; i <12; i++){
        UIButton *b = [myGameView.buttons objectAtIndex:i];
        Card *c = [self.cards objectAtIndex:i];
        [b.layer addSublayer:c.cardLayer];
      
    }
}

// ------------------------------------------- Game logic ------------------------------------------------

-(IBAction)selectedCard:(UIButton *)sender
{
    if (sender.selected ==YES) {
        sender.selected = NO;
        sender.layer.shadowColor = [UIColor  blackColor].CGColor;
        sender.layer.shadowOpacity = 0.2;
        sender.layer.shadowRadius = 3;
        sender.layer.borderColor = [UIColor clearColor].CGColor;
        

        numberSelected -= 1;
    } else{
        sender.selected = YES;
        
        if (numberSelected < 3) {
            numberSelected += 1;
            sender.layer.shadowColor = [UIColor colorWithRed:0.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0].CGColor;
            sender.layer.shadowOpacity = 0.9;
            sender.layer.shadowRadius = 6;
            sender.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0].CGColor;
            sender.layer.borderWidth = 1.5;
            sender.layer.cornerRadius = 8.0;
        }
        
        if (numberSelected == 3) {
            cardThree = [myGameView.buttons indexOfObject:sender];
            [self checkForSet];
            
        }else if (numberSelected == 2){
            cardTwo = [myGameView.buttons indexOfObject:sender];
            
        }else if (numberSelected ==1){
            cardOne = [myGameView.buttons indexOfObject:sender];
        }
    }
    
}

-(void)checkForSet
{
    Set *mySet = [[Set alloc]init];
    BOOL set = [mySet checkTotalForCardOne:[self.cards objectAtIndex:cardOne] Two:[self.cards objectAtIndex:cardTwo] Three:[self.cards objectAtIndex:cardThree]];
    
    if (set ==TRUE) {
        numberOfSets +=1;
        scoreLabel.text = [NSString stringWithFormat:@"Sets: %i", numberOfSets];
        numberSelected=0;
        
        if (specialMode) {
            [self drawNextCardsSpecialMode];
        }else{
            [self drawNextCards];
        }
    
    } else{
        [self showNotificationWithText:@"Not a set"];
        numberSelected=0;
    }
    
    for (int i =0; i <15; i++){
        UIButton *b = [myGameView.buttons objectAtIndex:i];
        b.selected = NO;
        b.layer.shadowColor = [UIColor  blackColor].CGColor;
        b.layer.shadowOpacity = 0.2;
        b.layer.shadowRadius = 3;
        b.layer.borderColor = [UIColor clearColor].CGColor;    }
}


-(void)drawNextCards
{

    
    if ([self.cards count] > 14) {
        
        //remove old layer
        for (int i =0; i < 12; i++){
            Card *c = [self.cards objectAtIndex:i];
            [c.cardLayer removeFromSuperlayer];
        }
        
        //Replace selected cards with the last one in the array and then remove it
        [self.cards exchangeObjectAtIndex:cardOne withObjectAtIndex:(self.cards.count - 1)];
        [self.cards removeObject:[self.cards lastObject]];
        [self.cards exchangeObjectAtIndex:cardTwo withObjectAtIndex:(self.cards.count - 1)];
        [self.cards removeObject:[self.cards lastObject]];
        [self.cards exchangeObjectAtIndex:cardThree withObjectAtIndex:(self.cards.count - 1)];
        [self.cards removeObject:[self.cards lastObject]];
        
        //add new layer
        for (int i =0; i < 12; i++){
            UIButton *b = [myGameView.buttons objectAtIndex:i];
            Card *c = [self.cards objectAtIndex:i];
            [b.layer addSublayer:c.cardLayer];
        }

    
    } else {
        for (int i = 11; i >= 0; i--) {
            if (i == cardOne | i==cardTwo | i==cardThree) {
                Card *c =[self.cards objectAtIndex:i];
                [c.cardLayer removeFromSuperlayer];
                [self.cards removeObjectAtIndex:i];
            }
        }
 
        BOOL set = [self isThereASetInArray:self.cards];
        if (set == FALSE) {
            [self gameEnd];
        }else{
        }
    }

}



//------------------------------------------ Check for Set -----------------------------------------------

-(void)isThereASet
{
    if (specialMode) {
        [self isThereASetSpecialMode];
    }else {
        [self isThereASetNormalMode];
    }
}

-(void)isThereASetNormalMode
{
    NSMutableArray *checkForSet =[[NSMutableArray alloc]init];
    
    NSUInteger x=0;
    if (self.cards.count >12) {
        x=12;
    }else{
        x = self.cards.count;
    }
    
    for (int i=0; i < x; i++) {
        [checkForSet addObject:[self.cards objectAtIndex:i]];
    }
    
    Set *mySet = [[Set alloc]init];
    BOOL succes = [mySet setInArray:checkForSet];
    
    if (succes) {
        [self showNotificationWithText:@"There is a set"];
       
    }else{
        //Check to see if there are any non-open cards left
        if (self.cards.count > 12) {
            [self shiftButtonsUp: YES];
            specialMode = TRUE;
        }else{
            [self gameEnd];
        }
    }
    
}


-(BOOL)isThereASetInArray: (NSMutableArray *)array
{
    
    Set *mySet = [[Set alloc]init];
    BOOL succes = [mySet setInArray:array];
    return succes;
}

//Special mode means 15 cards open, instead of the normal 12
-(void)isThereASetSpecialMode
{
    NSMutableArray *checkForSet =[[NSMutableArray alloc]init];
    
    for (int i=0; i < 15; i++) {
        [checkForSet addObject:[self.cards objectAtIndex:i]];
    }
    
    Set *mySet = [[Set alloc]init];
    BOOL succes = [mySet setInArray:checkForSet];
    
    if (succes) {
        [self showNotificationWithText:@"There is a set"];
    }else{
        //Check to see if there are any non-open cards left
        if (self.cards.count > 15) {
            
            //exchange the three special cards with new ones
            [self.cards exchangeObjectAtIndex:12 withObjectAtIndex:(self.cards.count - 1)];
            [self.cards exchangeObjectAtIndex:13 withObjectAtIndex:(self.cards.count - 2)];
            [self.cards exchangeObjectAtIndex:14 withObjectAtIndex:(self.cards.count - 3)];
            
            //Reset the button layers for the last three buttons
            for (int i =12; i < 15; i++){
                UIButton *b = [myGameView.buttons objectAtIndex:i];
                Card *c = [self.cards objectAtIndex:i];
                [b.layer addSublayer:c.cardLayer];
            }
           
        }else{
            [self gameEnd];
        }
    }
    
}


//------------------------------------------ Notify user -------------------------------------------------

-(void)showNotificationWithText: (NSString *)text
{
    //Move a textLabel down and back up
    [self.view addSubview:notify];
    notify.text = text;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         notify.frame = CGRectOffset(notify.frame, 0.0, 50);
                     }
     
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.3 delay:0.9 options:UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              notify.frame = CGRectOffset(notify.frame, 0.0, -50);
                                          }
                          
                                          completion:^(BOOL finished) {
                                              [notify removeFromSuperview];
                                              
                                              
                                          }];
                     }];

}




//------------------------------------------ SpecialMode: 15 cards open ------------------------------------

-(void)drawNextCardsSpecialMode
{
    
    //Put everything back to normal
    [self shiftButtonsUp:NO];
    
    //Remove the old layers
    for (int i =0; i <15; i++) {
        Card *c = [self.cards objectAtIndex:i];
        [c.cardLayer removeFromSuperlayer];
    }
    
    //Remove the set-cards, highest indexed card first
    for (int i = 14; i >= 0; i--) {
        if (i == cardOne | i==cardTwo | i==cardThree) {
            [self.cards removeObjectAtIndex:i];
        }
    }
    
    //Redraw the layers
    for (int i =0; i < 12; i++){
        UIButton *b = [myGameView.buttons objectAtIndex:i];
        Card *c = [self.cards objectAtIndex:i];
        [b.layer addSublayer:c.cardLayer];
    }

}


-(void)shiftButtonsUp: (BOOL)up
{
    float moveY = (up ? -30 : 30);
    float moveY2 = (up ? -35 : 35);
    float moveY3 = (up ? 40 : -40);

    float moveX2 = (up ? 70 : -70);
    float moveX3 = (up ? 180 : -180);

    
    if (up) {
        for (int i =12; i < 15; i++){
            UIButton *b = [myGameView.buttons objectAtIndex:i];
            Card *c = [self.cards objectAtIndex:i];
            [b.layer addSublayer:c.cardLayer];
        }
        [myGameView addThreeButtons];
    }else{
        specialMode = FALSE;
        [myGameView removeThreeButtons];
    }
    
    [UIView transitionWithView:myGameView duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{myGameView.frame = CGRectOffset(myGameView.frame, 0.0, moveY);} completion:nil];
    
     [UIView transitionWithView:timerLabel duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{timerLabel.frame = CGRectOffset(timerLabel.frame, moveX3, moveY2);} completion:nil];
    
    [UIView transitionWithView:checkSet duration:0.6 options:UIViewAnimationOptionBeginFromCurrentState animations:^{checkSet.frame = CGRectOffset(checkSet.frame, moveX2, 0);} completion:nil];
    
    [UIView transitionWithView:scoreLabel duration:0.6 options:UIViewAnimationOptionBeginFromCurrentState animations:^{scoreLabel.frame = CGRectOffset(scoreLabel.frame, 0, moveY3);} completion:nil];
    
}
//------------------------------------------Timer----------------------------------------------------------

-(void)updateTimer
{
    counter++;
    
    if (self.race) {
        if (counter > 30) {
            [self gameEnd];
        }else{
            [timerLabel setText:[self convertRaceTimer:counter]];
        }
    }else{
        [timerLabel setText:[self convertTimer:counter]];
    }
    
}

-(NSString *)convertTimer:(NSUInteger)i
{
    
    NSUInteger sec=i % 60;
    NSUInteger min=((i-sec)/60)%60;
    NSUInteger hour=i/3600;
    
    NSString *timeString;
    
    if (sec<10 && min<10){
        timeString = [NSString stringWithFormat:@"%li:0%lu:0%li", (unsigned long)hour, (unsigned long)min, (unsigned long)sec];
    }else if (sec>9 && min<10){
        timeString = [NSString stringWithFormat:@"%li:0%lu:%lu", (long)hour, (unsigned long)min, (unsigned long)sec];
    }else if(sec<10 && min>9){
        timeString = [NSString stringWithFormat:@"%li:%li:0%lu", (long)hour, (long)min, (unsigned long)sec];
    }else{
        timeString = [NSString stringWithFormat:@"%li:%lu:%lu", (long)hour, (unsigned long)min, (unsigned long)sec];
    }
    
    return timeString;
    
}

-(NSString *)convertRaceTimer:(NSUInteger)i
{
    NSUInteger count = 120 - i;
    NSUInteger sec=(count % 60);
    NSUInteger min=((count-sec)/60)%60;
    
    
    NSString *timeString;
    
    if (sec<10 && min<10){
        timeString = [NSString stringWithFormat:@"0%lu:0%li", (unsigned long)min, (unsigned long)sec];
    }else if (sec>9 && min<10){
        timeString = [NSString stringWithFormat:@"0%lu:%lu", (unsigned long)min, (unsigned long)sec];
    }
    
    return timeString;
    
}

//------------------------------------------Move to other screens --------------------------------------

-(void)goToMenu
{
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{[self.navigationController popViewControllerAnimated:NO];} completion:nil];

}

-(void)gameEnd
{
    [timer invalidate];
    
    int score;
    if (numberOfSets>0) {
        score = counter/numberOfSets;
    }else{
        score = 120;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    int oldScore = [defaults integerForKey:@"highScore"];
    NSString *scoreString = [NSString stringWithFormat:@"%i",score];
    
    if (oldScore == 0) {
        [defaults setObject:scoreString forKey:@"highScore"];
    }else if (oldScore > score){
        [defaults setObject:scoreString forKey:@"highScore"];
    }
    
    int newScore = [defaults integerForKey:@"highScore"];
    
    ScoreViewController *scoreVC = [[ScoreViewController alloc]init];
    scoreVC.scoreString = [NSString stringWithFormat:@"GAME OVER!  \n\nScore:\n %i seconds per set \n\nHighscore:\n %i seconds per set", score, newScore];
    [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[[self navigationController]pushViewController:scoreVC animated:NO];} completion:nil];

}


//------------------------------------------Set all UI items to nil--------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    timerLabel=nil;
    notify=nil;
    scoreLabel=nil;
    checkSet=nil;
    myGameView=nil;
}

@end
