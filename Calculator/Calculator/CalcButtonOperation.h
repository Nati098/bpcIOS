//
//  ButtonOperationDesign.h
//  Calculator
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CalcButtonOperation : UIButton

@property (nonatomic, assign) BOOL isActive;

- (void) setActive:(BOOL)state;

@end
