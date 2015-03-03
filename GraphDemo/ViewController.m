//
//  ViewController.m
//  GraphDemo
//
//  Created by xinshunwang on 15/2/13.
//  Copyright (c) 2015年 xinshunwang. All rights reserved.
//

#import "ViewController.h"
#import "MyTest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyTest * viewDemo = [[MyTest alloc] init] ;
    
    CALayer *myLayer = [CALayer layer];   
    
    
    [self setView:viewDemo] ;
    [[self view] setBackgroundColor:[UIColor greenColor]] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
