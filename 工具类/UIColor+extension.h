//
//  UIColor+extension.h
//  FuCardApp
//
//  Created by 裕福 on 15/2/15.
//  Copyright (c) 2015年 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (extension)

+ (UIColor*) colorWithHex:(NSString*)hexValueStr alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSString*)hexValueStr;
+ (NSString *) hexFromUIColor: (UIColor*) color;

@end
