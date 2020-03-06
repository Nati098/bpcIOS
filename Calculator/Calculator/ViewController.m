//
//  ViewController.m
//  Calculator
//
//  Created by Nati on 2/16/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "CalcButtonOperation.h"
#import "CalcBrain.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, assign, getter=isInTextInputMode) BOOL inTextInputMode;
@property (nonatomic, assign) NSInteger lastActiveOperationTag;
@property (nonatomic, strong) CalcBrain *brain;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clear];
}


- (IBAction)buttonWithDigitDidTap:(UIButton *)button {
    NSString *digit = @"";
    if ([button.titleLabel.text isEqualToString:@"pi"]) {
        digit = [NSString stringWithFormat:@"%.5lf", M_PI];
        self.inTextInputMode = NO;
    }
    else {
        digit = button.titleLabel.text;
    }
    
    if (self.isInTextInputMode) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:digit];
    }
    else {
        self.inTextInputMode = YES;
        self.displayLabel.text = digit;
    }
}

- (IBAction)buttonWithPointDidTap:(UIButton *)button {
    NSLog(@"");
    self.inTextInputMode = !self.inTextInputMode ? YES : self.inTextInputMode;
    if (![self.displayLabel.text containsString:@"."]) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
    }
}

- (IBAction)buttonWithOperationDidTap:(CalcButtonOperation *)button {
    //NSLog(@"tapped: %ld", button.tag);
    NSString *operator = button.titleLabel.text;
    self.brain.operator = operator;
    self.brain.waitingOperand = [self displayValue];
    
    [self resetActiveOperationButtons];
    [button setActive:YES];
    self.lastActiveOperationTag = button.tag;
    
    //self.displayLabel.text = @"0";
    self.inTextInputMode = NO;

}

- (IBAction)performOperationButtonDidTap:(UIButton *)button {
    self.brain.operand = [self displayValue];
    self.brain.operator = button.titleLabel.text;
    double result = [self.brain performOperation];
    [self setResult:result];
    
    [self resetActiveOperationButtons];
}

- (IBAction)performCleaning:(UIButton *)button {
    [self resetActiveOperationButtons];
    [self clear];
}


- (CalcBrain *)brain {
    if (!_brain) {
        _brain = [[CalcBrain alloc] init];
    }
    return _brain;
}

- (double)displayValue {
    return self.displayLabel.text.doubleValue;
}

- (void) resetActiveOperationButtons {
    if (self.lastActiveOperationTag > 0) {
        CalcButtonOperation *lastActiveButton = [self.view viewWithTag:self.lastActiveOperationTag];
        [lastActiveButton setActive:NO];
    }
}

- (void)clear {
    self.displayLabel.text = @"0";
    self.inTextInputMode = NO;
    self.lastActiveOperationTag = -1;
    
    [self.brain clear];
}

- (void)setResult:(double)result {
    self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
    self.inTextInputMode = NO;
}

@end
