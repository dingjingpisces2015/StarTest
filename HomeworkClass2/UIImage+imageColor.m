//
//  UIImage+imageColor.m
//  HomeworkClass2
//
//  Created by TWO_FISH on 15/2/12.
//  Copyright (c) 2015年 TWO_FISH. All rights reserved.
//

#import "UIImage+imageColor.h"

@implementation UIImage (imageColor)
+ (UIImage *)imageWithColor:(UIColor *)color withHight:(CGFloat)hight withWidth:(CGFloat)width
{
    CGRect rect = CGRectMake(0.0f, 0.0f, width, hight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
