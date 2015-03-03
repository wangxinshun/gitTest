//
//  MyLayerDelege.m
//  GraphDemo
//
//  Created by xinshunwang on 15/2/13.
//  Copyright (c) 2015年 xinshunwang. All rights reserved.
//

#import "MyLayerDelege.h"
#import <UIKit/UIKit.h>
@implementation MyLayerDelege

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    UIGraphicsPopContext();
    
} 

@end
