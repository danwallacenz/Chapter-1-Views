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
    
    NSLog(@"mainView frame origin.x = %f", mainView.frame.origin.x);
    NSLog(@"mainView frame origin.y = %f", mainView.frame.origin.y);
    NSLog(@"mainView frame size.height = %f", mainView.frame.size.height);
    NSLog(@"mainView frame size.width = %f", mainView.frame.size.width);
    
    NSLog(@"mainView bounds origin.x = %f", mainView.bounds.origin.x);
    NSLog(@"mainView bounds origin.y = %f", mainView.bounds.origin.y);
    NSLog(@"mainView bounds size.height = %f", mainView.bounds.size.height);
    NSLog(@"mainView bounds size.width = %f", mainView.bounds.size.width);
    
    NSLog(@"mainView center.x = %f", mainView.center.x);
    NSLog(@"mainView center.y = %f", mainView.center.y);

    
    NSLog(@"v frame origin.x = %f", v.frame.origin.x);
    NSLog(@"v frame origin.y = %f", v.frame.origin.y);
    NSLog(@"v frame size.height = %f", v.frame.size.height);
    NSLog(@"v frame size.width = %f", v.frame.size.width);
    
    NSLog(@"v bounds origin.x = %f", v.bounds.origin.x);
    NSLog(@"v bounds origin.y = %f", v.bounds.origin.y);
    NSLog(@"v bounds size.height = %f", v.bounds.size.height);
    NSLog(@"v bounds size.width = %f", v.bounds.size.width);
    
    NSLog(@"v center.x = %f", v.center.x);
    NSLog(@"v center.y = %f", v.center.y);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
