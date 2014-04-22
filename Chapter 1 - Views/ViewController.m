//
//  ViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 22/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *smallRedSquare;

@property (strong, nonatomic) UIView *purpleRect;
@property (strong, nonatomic) UIView *greenRect;
@property (strong, nonatomic) UIView *redRect;

@property (strong, nonatomic) UIView *purpleFrame;
@property (strong, nonatomic) UIView *greenInset;

@property (weak, nonatomic) IBOutlet UISlider *smallRedSquareViewAlphaSlider;


@end

@implementation ViewController


// large red rectangle actions
- (IBAction)largeRedRectangleRemoveAddSwitch:(UISwitch *)sender {
    if(self.redRect.superview){
        [self.redRect removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.redRect];
    }
}

// purple rectangle actions

- (IBAction)purpleRectangleRemoveAddSwitch:(UISwitch *)sender {
    NSLog(@"purpleRectangleRemoveAddSwitch switched");
    if(self.purpleRect.superview){
        [self.purpleRect removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.purpleRect];
    }
}

- (IBAction)purpleRectangleViewAlphaChanged:(UISlider *)sender {
    self.purpleRect.alpha = sender.value;
}

- (IBAction)purpleRectangleClipToBounds:(UISwitch *)sender {
    self.purpleRect.clipsToBounds = !self.purpleRect.clipsToBounds;
}

// Small red square actions

- (IBAction)smallRedSquareRemoveAddSwitch:(UISwitch *)sender {
    NSLog(@"smallRedSquareRemoveAddSwitch switched");
    if(self.smallRedSquare.superview){
        [self.smallRedSquare removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.smallRedSquare];
    }
}

- (IBAction)smallRedSquareViewAlphaChanged:(UISlider *)sender {
    
    NSLog(@"Setting small red square VIEW alpha to %f", sender.value);
    self.smallRedSquare.alpha = sender.value;
     NSLog(@"Actual alpha is %f", self.smallRedSquare.alpha*sender.value);
}

- (IBAction)smallRedSquareColorAlphaChanged:(UISlider *)sender {
    NSLog(@"Setting small red square BACKGROUND COLOR` alpha to %f", sender.value);
    self.smallRedSquare.backgroundColor = [self.smallRedSquare.backgroundColor colorWithAlphaComponent:sender.value];
    NSLog(@"Actual alpha is %f", self.smallRedSquare.alpha*sender.value);
}

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
    self.smallRedSquare = [[UIView alloc] initWithFrame: CGRectMake(100,100,50,50)];
    self.smallRedSquare.backgroundColor = [UIColor redColor];
    [mainView addSubview: self.smallRedSquare];
    
    [self logView: mainView name: @"mainView"];
    
    [self logView: self.smallRedSquare name: @"smallRedSquare"];
}

- (void) addOverlappingViews
{
//    CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
    
    self.purpleRect = [[UIView alloc] initWithFrame: CGRectMake(113, 111, 132, 194)];
    self.purpleRect.backgroundColor = [UIColor colorWithRed:1 green: .4 blue: 1 alpha: 1];
    
    self.greenRect = [[UIView alloc] initWithFrame: CGRectMake(41, 56, 132, 194)];
    self.greenRect.backgroundColor = [UIColor colorWithRed: .5 green: 1 blue: 0 alpha: 1];
    
    self.redRect = [[UIView alloc] initWithFrame: CGRectMake(43, 197, 160, 230)];
    self.redRect.backgroundColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    
    UIView* mainView = self.view;
    [mainView addSubview: self.purpleRect];
    [self.purpleRect addSubview:self.greenRect];
    [mainView addSubview:self.redRect];
    
    [self logView: self.purpleRect name: @"purpleRect"];
    [self logView: self.greenRect name: @"greenRect"];
    [self logView: self.redRect name: @"redRect"];
    
}

-(void) addInsetRect
{
    self.purpleFrame = [[UIView alloc] initWithFrame:CGRectMake(313, 111, 132, 194)];
    self.purpleFrame.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
//    CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
    
    self.greenInset = [[UIView alloc] initWithFrame:CGRectInset(self.purpleFrame.bounds, 10, 10)];
   self. greenInset.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    
    UIView* mainView = self.view;
    [mainView addSubview:self.purpleFrame];
    [self.purpleFrame addSubview:self.greenInset];
    
    [self logView:self.purpleFrame name:@"purpleFrame"];
    [self logView:self.greenInset name:@"greenInset"];
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
