//
//  CalcBrain.h
//  Calculator
//
//  Created by Nati on 2/16/20.
//  Copyright © 2020 Nati. All rights reserved.
//
#include "math.h"
#import <Foundation/Foundation.h>

@interface CalcBrain : NSObject

@property (nonatomic, assign) double operand;
@property (nonatomic, assign) double waitingOperand;
@property (nonatomic, copy) NSString *operator;


- (double)performOperation;
- (double)performBinaryOperation;
- (void)clear;

@end
