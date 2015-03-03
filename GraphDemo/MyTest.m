//
//  MyTest.m
//  GraphDemo
//
//  Created by xinshunwang on 15/2/13.
//  Copyright (c) 2015年 xinshunwang. All rights reserved.
//

#import "MyTest.h"

@implementation MyTest


- (void)drawRect:(CGRect)rect
{
    //1 创建缓存
//    UIImage* mars = [UIImage imageNamed:@"edit1.png"];
//    
//    CGSize sz = [mars size];
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width, sz.height), NO, 0);
//    
//    [mars drawInRect:CGRectMake(0,0,sz.width,sz.height)blendMode:kCGBlendModeMultiply alpha:0.5];
//    
//    [mars drawInRect:CGRectMake(sz.width/4.0, sz.height/4.0, sz.width *0.5, sz.height*0.5) blendMode:kCGBlendModeMultiply alpha:1.0];
//    
//    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    [im drawAtPoint:CGPointMake(20, 30)] ;
    
    // 2Graphics
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    
//    CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
//    
//    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
//    
//    CGContextFillPath(con);
   
//        UIImage* mars = [UIImage imageNamed:@"edit1.png"];
//    
//        CGSize sz = [mars size];
//    
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width/2, sz.height), NO, 0);
//    
//        //[mars drawInRect:CGRectMake(0,0,sz.width,sz.height)blendMode:kCGBlendModeMultiply alpha:0.5];
//        [mars drawAtPoint:CGPointMake(-sz.width, 0)] ;
//    
//    
//        //[mars drawInRect:CGRectMake(sz.width/4.0, sz.height/4.0, sz.width *0.5, sz.height*0.5) blendMode:kCGBlendModeMultiply alpha:1.0];
//    
//        UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
//    
//        UIGraphicsEndImageContext();
//        [im drawAtPoint:CGPointMake(20, 30)] ;

    
    
    [[self leftAndRight] drawAtPoint: CGPointMake(20, 30)] ;
}

-(UIImage *)leftAndRight
{
    UIImage* mars = [UIImage imageNamed:@"edit1.png"];
    
    // 抽取图片的左右半边
    
    CGSize sz = [mars size];
    
    CGImageRef marsLeft = CGImageCreateWithImageInRect([mars CGImage],CGRectMake(0,0,sz.width/2.0,sz.height));
    
    CGImageRef marsRight = CGImageCreateWithImageInRect([mars CGImage],CGRectMake(sz.width/2.0,0,sz.width/2.0,sz.height));
    
    // 将每一个CGImage绘制到图形上下文中
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width, sz.height), NO, 0);
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(con, CGRectMake(0,0,sz.width/2.0,sz.height), marsLeft);
    
    CGContextDrawImage(con, CGRectMake(sz.width/2,0,sz.width/2.0,sz.height), marsRight);
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // 记得释放内存，ARC在这里无效 
    
    CGImageRelease(marsLeft); 
    
    CGImageRelease(marsRight);
    
    CGImageRef flip (CGImageRef im) ;
        
    CGSize sss = CGSizeMake(CGImageGetWidth(im.CGImage), CGImageGetHeight(im.CGImage));
        
    UIGraphicsBeginImageContextWithOptions(sss, NO, 0);
        
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im.CGImage);
        
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
        
    UIGraphicsEndImageContext();
        
    return [[UIImage alloc] initWithCGImage:result] ;
}

@end
