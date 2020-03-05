//
//  CalcButtonSimple.m
//  Calculator
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "CalcButtonSimple.h"

@implementation CalcButtonSimple

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
}

@end
