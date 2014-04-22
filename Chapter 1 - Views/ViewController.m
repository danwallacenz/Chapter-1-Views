//
//  ViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 22/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView* mainView = self.view;
    UIView* v = [[UIView alloc] initWithFrame: CGRectMake(100,100,50,50)];
    v.backgroundColor = [UIColor redColor];
    [mainView addSubview: v];

    [self logView: mainView name: @"mainView"];
    
    [self logView: v name: @"v"];
}

- (void)logView: (UIView*)v name: (NSString*) name
{
    NSLog(@"%@ frame origin.x = %f", name, v.frame.origin.x);
    NSLog(@"%@ frame origin.y = %f", name, v.frame.origin.y);
    NSLog(@"%@ frame size.height = %f", name, v.frame.size.height);
    NSLog(@"%@ frame size.width = %f", name, v.frame.size.width);
    
    NSLog(@"%@ bounds origin.x = %f", name, v.bounds.origin.x);
    NSLog(@"%@ bounds origin.y = %f", name, v.bounds.origin.y);
    NSLog(@"%@ bounds size.height = %f", name, v.bounds.size.height);
    NSLog(@"%@ bounds size.width = %f", name, v.bounds.size.width);
    
    NSLog(@"%@ center.x = %f", name, v.center.x);
    NSLog(@"%@ center.y = %f", name, v.center.y);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
