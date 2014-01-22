//
//  GameButton.m
//  Set_2014
//
//  Created by Anouk Ruhaak on 1/22/14.
//  Copyright (c) 2014 Djipsy. All rights reserved.
//

#import "GameButton.h"

@implementation GameButton

- (id)initWithFrame:(CGRect)frame backgroundColor: (UIColor *)backC borderColor: (UIColor *)borderC textColorOne: (UIColor *)textOne textColorTwo: (UIColor *)textTwo
{
    self = [super initWithFrame:frame];
    if (self) {

        self.layer.borderColor = borderC.CGColor;
        self.layer.borderWidth = 1.5;
        self.backgroundColor = backC;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowRadius = 3;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = NO;
        self.layer.shadowOffset = CGSizeMake(0.1f, 0.3f);
        [self setTitleColor:textOne forState:UIControlStateHighlighted];
        [self setTitleColor:textTwo forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14.0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
