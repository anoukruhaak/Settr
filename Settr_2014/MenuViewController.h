//
//  MenuViewController.h
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/9/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController  <UINavigationControllerDelegate, UINavigationBarDelegate, UIAppearanceContainer>

@property (readwrite) int seconds;
@property (readwrite) int numberOfSets;

@end
