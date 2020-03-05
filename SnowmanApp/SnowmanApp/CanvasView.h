//
//  CanvasView.h
//  SnowmanApp
//
//  Created by Nati on 3/3/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface CanvasView : UIView

@property (nonatomic, getter=isEyesOpen) IBInspectable BOOL eyesOpen;
@property (nonatomic) IBInspectable CGFloat mouthLevel; // -1.0 for sad and 1.0 for smile
@property (nonatomic) IBInspectable CGFloat numOfSegments; // number of segments in body
@property (nonatomic) IBInspectable CGFloat multiplier;
@property (nonatomic) IBInspectable UIColor *mainColor;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable CGFloat segmentsRatio;

@end

NS_ASSUME_NONNULL_END
