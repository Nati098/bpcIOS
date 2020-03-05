//
//  ButtonOperationDesign.m
//  Calculator
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "CalcButtonOperation.h"

@implementation CalcButtonOperation

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.backgroundColor = [UIColor orangeColor].CGColor;
    
    self.isActive = NO;
}

- (void)setActive:(BOOL)state {
    self.isActive = state;
    [self setColor];
}

- (void)setColor {
    if (self.isActive) {
        self.layer.backgroundColor = [UIColor grayColor].CGColor;
    } else {
        self.layer.backgroundColor = [UIColor orangeColor].CGColor;
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
}

@end
