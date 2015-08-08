//
//  LGErrorTipView.h
//  ILSPrivatePhoto
//
//  Created by liuge on 7/3/15.
//  Copyright (c) 2015 iLegendSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGDropDownTipView : NSObject

+ (void)showMessage:(NSString *)message referenceView:(UIView *)view;

+ (void)setBackgroundColor:(UIColor *)color;

+ (void)setFont:(UIFont *)font;

+ (void)setTextColor:(UIColor *)textColor;

+ (void)setHeight:(CGFloat)height;

+ (void)reset;

@end
