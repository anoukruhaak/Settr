//
//  GameView.h
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/22/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameDelegate;

@interface GameView : UIView

@property (strong) UIButton *bOne;
@property (strong) UIButton *bTwo;
@property (strong) UIButton *bThree;
@property (strong) UIButton *bFour;
@property (strong) UIButton *bFive;
@property (strong) UIButton *bSix;
@property (strong) UIButton *bSeven;
@property (strong) UIButton *bEight;
@property (strong) UIButton *bNine;
@property (strong) UIButton *bTen;
@property (strong) UIButton *bEleven;
@property (strong) UIButton *bTwelve;
@property (strong) UIButton *bThirteen;
@property (strong) UIButton *bFourteen;
@property (strong) UIButton *bFifteen;

@property (nonatomic, strong) NSArray *buttons;

@property (nonatomic, strong) id<GameDelegate> delegate;

-(id)initWithFrame:(CGRect)frame;
-(void)addThreeButtons;
-(void)removeThreeButtons;

@end

@protocol GameDelegate <NSObject>

@required
-(IBAction)selectedCard:(UIButton *)sender;

@end


