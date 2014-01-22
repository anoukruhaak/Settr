//
//  GameViewController.h
//  Set
//
//  Created by Anouk Ruhaak on 1/1/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"

@interface GameViewController : UIViewController <UINavigationBarDelegate,UINavigationControllerDelegate, GameDelegate>

@property BOOL race;
@end
