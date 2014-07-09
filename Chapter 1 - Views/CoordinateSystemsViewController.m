//
//  CoordinateSystemsViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 9/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "CoordinateSystemsViewController.h"

@interface CoordinateSystemsViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueSquare;
@property (weak, nonatomic) IBOutlet UIView *redSquare;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CoordinateSystemsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self loadTextView];
}

-(void)loadTextView
{
    NSString *blueSquareFrame = NSStringFromCGRect(self.blueSquare.frame);
    NSString *blueSquareOrigin = NSStringFromCGPoint(self.blueSquare.frame.origin);
    NSString *blueSquareBounds = NSStringFromCGRect(self.blueSquare.bounds);
    NSString *blueSquareCenter = NSStringFromCGPoint(self.blueSquare.center);
    
    NSString *redSquareFrame = NSStringFromCGRect(self.redSquare.frame);
    NSString *redSquareOrigin = NSStringFromCGPoint(self.redSquare.frame.origin);
    NSString *redSquareBounds = NSStringFromCGRect(self.redSquare.bounds);
    NSString *redSquareCenter = NSStringFromCGPoint(self.redSquare.center);
    
    
    NSString *blueSquareDescription = [NSString stringWithFormat:@" blueSquareFrame = %@\n blueSquareOrigin = %@\n blueSquareBounds = %@\n blueSquareCenter = %@\n\n",blueSquareFrame, blueSquareOrigin, blueSquareBounds, blueSquareCenter];
    
    NSString *redSquareDescription = [NSString stringWithFormat:@" redSquareFrame = %@\n redSquareOrigin = %@\n redSquareBounds = %@\n redSquareCenter = %@\n",redSquareFrame, redSquareOrigin, redSquareBounds, redSquareCenter];
    
    self.textView.text = [NSString stringWithFormat:@"%@%@",blueSquareDescription,redSquareDescription];
}

@end
