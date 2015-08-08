//
//  LGErrorTipView.m
//  ILSPrivatePhoto
//
//  Created by liuge on 7/3/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import "LGDropDownTipView.h"

static CGFloat height;
static UIFont *font;
static UIColor *backgroundColor;
static UIColor *textColor;

static NSMutableArray *referenceArray, *messageArray;
static NSLock *theLock;

@implementation LGDropDownTipView

+ (void)initialize {
    referenceArray = [NSMutableArray new];
    messageArray = [NSMutableArray new];
    theLock = [NSLock new];
    [[self class] reset];
}

+ (void)showMessage:(NSString *)message referenceView:(UIView *)view {
    
    if (!view || !view.superview) return;
    
    [theLock lock];
    NSInteger index = [referenceArray indexOfObject:view];
    if (index == NSNotFound) {
        [referenceArray addObject:view];
        NSMutableArray *messages = [[NSMutableArray alloc] initWithObjects:message, nil];
        [messageArray addObject:messages];
        [theLock unlock];
        [[self class] showMessages:messages onLabel:nil referenceView:view];
    } else {
        NSMutableArray *messages = messageArray[index];
        if (![message isEqualToString:[messages lastObject]]) {
            [messages addObject:message];
        }
        [theLock unlock];
    }
}

+ (void)showMessages:(NSMutableArray *)messages onLabel:(UILabel *)label referenceView:(UIView *)view {
    
    UIView *superView = view.superview;
    if (!superView) return;
    
    CGRect frame = view.frame;
    frame.origin.y = CGRectGetMaxY(frame) - height;
    frame.size.height = height;
    
    // initialize label
    if (label == nil) {
        label = [[UILabel alloc] initWithFrame:frame];
        label.text = [messages firstObject];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = font;
        label.textColor = textColor;
        label.backgroundColor = backgroundColor;
        label.adjustsFontSizeToFitWidth = YES;
        
        [superView insertSubview:label belowSubview:view];
    }
    
    // animate
    CGRect frame0 = frame;
    frame0.origin.y += height;
    
    [UIView animateWithDuration:.25
                     animations:^{
                         label.frame = frame0;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:.35
                                               delay:2
                                             options:0
                                          animations:^{
                                              label.frame = frame;
                                          }
                                          completion:^(BOOL finished) {
                                              [messages removeObjectAtIndex:0];
                                              if (messages.count == 0) {
                                                  [label removeFromSuperview];
                                                  [theLock lock];
                                                  NSInteger index = [messageArray indexOfObject:messages];
                                                  [messageArray removeObjectAtIndex:index];
                                                  [referenceArray removeObjectAtIndex:index];
                                                  [theLock unlock];
                                              } else {
                                                  [[self class] showMessages:messages onLabel:label referenceView:view];
                                              }
                                          }];
                     }];
}

+ (void)setBackgroundColor:(UIColor *)aColor {
    backgroundColor = aColor;
}

+ (void)setFont:(UIFont *)aFont {
    font = aFont;
}

+ (void)setTextColor:(UIColor *)aTextColor {
    textColor = aTextColor;
}

+ (void)setHeight:(CGFloat)aHeight {
    height = aHeight;
}

+ (void)reset {
    height = 30;
    font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
    backgroundColor = [UIColor colorWithRed:155 / 255.f green:75 / 255.f blue:239 / 255.f alpha:.9f];
    textColor = [UIColor whiteColor];
}

@end
