//
//  CalcBrain.m
//  Calculator
//
//  Created by Nati on 2/16/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "CalcBrain.h"

@implementation CalcBrain

- (double)performOperation {
    double result = 0;
    
    if ([self.operator isEqualToString:@"sqrt"]) {
        result = sqrt(self.operand);
    }
    else if ( !self.operator || self.operator.length == 0) {
        result = self.operand;
    }
    else {
        result = [self performBinaryOperation];
    }

    return result;
}

- (double)performBinaryOperation {
    double result = 0;
    if ([self.operator isEqualToString:@"+"]) {
        result = self.waitingOperand + self.operand;
    }
    else if ([self.operator isEqualToString:@"-"]) {
        result = self.waitingOperand - self.operand;
    }
    else if ([self.operator isEqualToString:@"*"]) {
        result = self.waitingOperand * self.operand;
    }
    else if ([self.operator isEqualToString:@"/"]) {
        if (self.operand != 0) {
            result = self.waitingOperand / self.operand;
        }
        
    }
    
    return result;
}

- (void)clear{
    self.operand = 0;
    self.waitingOperand = 0;
    
    self.operator = @"";
}

@end
