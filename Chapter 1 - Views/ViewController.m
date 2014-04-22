//
//  ViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 22/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *smallRedSquare;

@property (weak, nonatomic) UIView *purpleRect;
@property (weak, nonatomic) UIView *greenRect;
@property (weak, nonatomic) UIView *redRect;

@property (weak, nonatomic) UIView *purpleFrame;
@property (weak, nonatomic) UIView *greenInset;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addSmallRedSquare];
    
    [self addOverlappingViews];
    
    [self addInsetRect];
    
    // In debugger console enter 'po [self.view recursiveDescription]'
}

-(void) addSmallRedSquare
{
    UIView* mainView = self.view;
    UIView* smallRedSquare = [[UIView alloc] initWithFrame: CGRectMake(100,100,50,50)];
    smallRedSquare.backgroundColor = [UIColor redColor];
    [mainView addSubview: smallRedSquare];
    
    [self logView: mainView name: @"mainView"];
    
    [self logView: smallRedSquare name: @"smallRedSquare"];
}

- (void) addOverlappingViews
{
//    CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
    
    UIView *purpleRect = [[UIView alloc] initWithFrame: CGRectMake(113, 111, 132, 194)];
    purpleRect.backgroundColor = [UIColor colorWithRed:1 green: .4 blue: 1 alpha: 1];
    
    UIView *greenRect = [[UIView alloc] initWithFrame: CGRectMake(41, 56, 132, 194)];
    greenRect.backgroundColor = [UIColor colorWithRed: .5 green: 1 blue: 0 alpha: 1];
    
    UIView *redRect = [[UIView alloc] initWithFrame: CGRectMake(43, 197, 160, 230)];
    redRect.backgroundColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    
    UIView* mainView = self.view;
    [mainView addSubview: purpleRect];
    [purpleRect addSubview:greenRect];
    [mainView addSubview:redRect];
    
    [self logView: purpleRect name: @"purpleRect"];
    [self logView: greenRect name: @"greenRect"];
    [self logView: redRect name: @"redRect"];
    
}

-(void) addInsetRect
{
    UIView* purpleFrame = [[UIView alloc] initWithFrame:CGRectMake(313, 111, 132, 194)];
    purpleFrame.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
//    CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
    
    UIView* greenInset = [[UIView alloc] initWithFrame:CGRectInset(purpleFrame.bounds, 10, 10)];
    greenInset.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    
    UIView* mainView = self.view;
    [mainView addSubview:purpleFrame];
    [purpleFrame addSubview:greenInset];
    
    [self logView:purpleFrame name:@"purpleFrame"];
    [self logView:greenInset name:@"greenInset"];
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
