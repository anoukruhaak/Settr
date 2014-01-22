//
//  GameLabels.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/22/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "GameLabels.h"

@implementation GameLabels

- (id)initWithFrame:(CGRect)frame andColor: (UIColor *)backGround andColor: (UIColor *)border textColor: (UIColor *)textColor fontSize: (float)font
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame= frame;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:font];
        self.backgroundColor = [UIColor clearColor];
        self.textColor = textColor;
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius=8.0;
        self.layer.zPosition=2.0;
        self.layer.backgroundColor = backGround.CGColor;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowRadius = 2;
        self.layer.shadowOffset = CGSizeMake(0.3f, 0.5f);
        self.layer.masksToBounds = NO;
        self.lineBreakMode = NSLineBreakByCharWrapping;
        self.layer.borderColor= border.CGColor;
        self.layer.borderWidth=1.5;

    }
    return self;
}


@end
