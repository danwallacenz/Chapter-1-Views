//
//  ConstraintsViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ConstraintsViewController.h"
#import "ConstrainedView.h"
#import "TopBar.h"
#import "BottomSquare.h"
#import "Frame.h"

@interface ConstraintsViewController ()

@property (strong, nonatomic) ConstrainedView *frameView;
@property (strong, nonatomic) ConstrainedView *topBar;
@property (strong, nonatomic) BottomSquare *bottomRightSquare;
@property (strong, nonatomic) UIView *mainView;

@property (weak, nonatomic) IBOutlet UILabel *widthSliderValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *scaleWidthSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleHeightSlider;
@property (weak, nonatomic) IBOutlet UILabel *heightScaleValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UILabel *rhsConstraintValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomConstraintValueLabel;

@property (weak, nonatomic) IBOutlet UISlider *redSquareRHSDistanceSlider;
@property (weak, nonatomic) IBOutlet UISlider *redSquareBottomDistanceSlider;

@end

@implementation ConstraintsViewController

#pragma mark - actions

- (IBAction)redSquareBottomDistanceChanged:(UISlider *)sender {
    
    [self.bottomRightSquare updateDistanceOfRedSquareFromBottom: sender.value];
    self.bottomConstraintValueLabel.text = [NSString stringWithFormat:@"%f",sender.value];
}

- (IBAction)redSquareRHSDistanceChanged:(UISlider *)sender {
    
    [self.bottomRightSquare updateDistanceOfRedSquareFromRHS: sender.value];
    self.rhsConstraintValueLabel.text = [NSString stringWithFormat:@"%f",sender.value];
}

// concatenate transforms
- (IBAction)rotateFrame:(UISlider *)sender {
    CGAffineTransform rotate = CGAffineTransformMakeRotation(self.rotateSlider.value * M_PI/180.0);
    CGAffineTransform scaleWidth = CGAffineTransformMakeScale(self.scaleWidthSlider.value, self.scaleHeightSlider.value);
    self.frameView.transform = CGAffineTransformConcat(scaleWidth, rotate);
}

// concatenate transforms
- (IBAction)updateWidth:(UISlider *)sender {
    // do any rotation first

    CGAffineTransform rotate = CGAffineTransformMakeRotation(self.rotateSlider.value * M_PI/180.0);
    CGAffineTransform scaleWidth = CGAffineTransformMakeScale(self.scaleWidthSlider.value, self.scaleHeightSlider.value);

    self.frameView.transform = CGAffineTransformConcat(scaleWidth, rotate);
    
    self.widthLabel.text = [NSString stringWithFormat:@"%f", self.frameView.frame.size.width ];

    self.widthSliderValueLabel.text = [NSString stringWithFormat:@"%f", sender.value ];
}

// concatenate transforms
- (IBAction)updateHeight:(UISlider *)sender {
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(self.rotateSlider.value * M_PI/180.0);
    CGAffineTransform scaleHeight = CGAffineTransformMakeScale(self.scaleWidthSlider.value, sender.value);
    
    self.frameView.transform = CGAffineTransformConcat(scaleHeight, rotate);

    self.heightLabel.text = [NSString stringWithFormat:@"%f", self.frameView.frame.size.height ];
    
    self.heightScaleValueLabel.text = [NSString stringWithFormat:@"%f", sender.value ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainView =  self.view;
    
//    self.frameView = [[Frame alloc] initWithFrame:CGRectMake(100, 111,132,194)]; // Now using constraints
    
    self.frameView = [Frame new];
    self.frameView.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
    self.topBar = [TopBar new];
    self.topBar.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    
    self.bottomRightSquare = [BottomSquare new];
    self.bottomRightSquare.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];

    [self.mainView addSubview:self.frameView];
    
    [self.frameView addSubview:self.topBar];
    [self.frameView addSubview:self.bottomRightSquare];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}

@end
