//
//  UIColor+extension.m
//  FuCardApp
//
//  Created by 裕福 on 15/2/15.
//  Copyright (c) 2015年 Victor. All rights reserved.
//

#import "UIColor+extension.h"

@implementation UIColor (extension)

+ (UIColor*) colorWithHex:(NSString*)hexValueStr alpha:(CGFloat)alphaValue
{
    const char *cString2 = [hexValueStr UTF8String];
    NSInteger hexValue = hex2dec(cString2);
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSString*)hexValueStr
{
    return [UIColor colorWithHex:hexValueStr alpha:1.0];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}


/*
 * 将字符转换为数值
 * */
int c2i(char ch)
{
    // 如果是数字，则用数字的ASCII码减去48, 如果ch = '2' ,则 '2' - 48 = 2
    if(isdigit(ch))
        return ch - 48;
    
    // 如果是字母，但不是A~F,a~f则返回
    if( ch < 'A' || (ch > 'F' && ch < 'a') || ch > 'z' )
        return -1;
    
    // 如果是大写字母，则用数字的ASCII码减去55, 如果ch = 'A' ,则 'A' - 55 = 10
    // 如果是小写字母，则用数字的ASCII码减去87, 如果ch = 'a' ,则 'a' - 87 = 10
    if(isalpha(ch))
        return isupper(ch) ? ch - 55 : ch - 87;
    
    return -1;
}

/*
 * 功能：将十六进制字符串转换为整型(int)数值
 * */
int hex2dec(const char *hex)
{
    int len;
    int num = 0;
    int temp;
    int bits;
    int i;
    
    // 此例中 hex = "1de" 长度为3, hex是main函数传递的
    len = strlen(hex);
    
    for (i=0, temp=0; i<len; i++, temp=0)
    {
        // 第一次：i=0, *(hex + i) = *(hex + 0) = '1', 即temp = 1
        // 第二次：i=1, *(hex + i) = *(hex + 1) = 'd', 即temp = 13
        // 第三次：i=2, *(hex + i) = *(hex + 2) = 'd', 即temp = 14
        temp = c2i( *(hex + i) );
        // 总共3位，一个16进制位用 4 bit保存
        // 第一次：'1'为最高位，所以temp左移 (len - i -1) * 4 = 2 * 4 = 8 位
        // 第二次：'d'为次高位，所以temp左移 (len - i -1) * 4 = 1 * 4 = 4 位
        // 第三次：'e'为最低位，所以temp左移 (len - i -1) * 4 = 0 * 4 = 0 位
        bits = (len - i - 1) * 4;
        temp = temp << bits;
        
        // 此处也可以用 num += temp;进行累加
        num = num | temp;
    }
    
    // 返回结果
    return num;
}

@end