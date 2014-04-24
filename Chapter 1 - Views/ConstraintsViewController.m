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
@property (strong, nonatomic) ConstrainedView *bottomRightSquare;
@property (strong, nonatomic) UIView *mainView;

@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *widthSliderValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *scaleWidthSlider;

@property float previousSliderValue;

@end

@implementation ConstraintsViewController

#pragma mark - actions
- (IBAction)rotateFrame:(UISlider *)sender {
    self.frameView.transform = CGAffineTransformMakeRotation(sender.value * M_PI/180.0);
}

- (IBAction)updateWidth:(UISlider *)sender {
//    CGRect frameViewBounds =  self.frameView.bounds;
//    
//    if(sender.value > self.previousSliderValue){
//        frameViewBounds.size.width = sender.value + frameViewBounds.size.width;
//    }else{
//        frameViewBounds.size.width = sender.value - frameViewBounds.size.width;
//    }
//    self.previousSliderValue = sender.value;
//    
//    self.frameView.bounds = frameViewBounds;
//    
//    self.widthLabel.text = [NSString stringWithFormat:@"%f", self.frameView.bounds.size.width ];
//    
//    self.widthSliderValueLabel.text = [NSString stringWithFormat:@"%f", sender.value ];
//    
//    [self.frameView setNeedsUpdateConstraints];
    
    self.frameView.transform = CGAffineTransformMakeScale(sender.value, self.scaleWidthSlider.value);
}

- (IBAction)updateHeight:(UISlider *)sender {
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainView =  self.view;
    
    self.frameView = [[Frame alloc] initWithFrame:CGRectMake(100, 111,132,194)];
    self.frameView.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
    self.topBar = [TopBar new];
    self.topBar.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    
    self.bottomRightSquare = [BottomSquare new];
    self.bottomRightSquare.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];

    [self.mainView addSubview:self.frameView];
    
    [self.frameView addSubview:self.topBar];
    [self.frameView addSubview:self.bottomRightSquare];
    
    self.previousSliderValue = 0;
    
//    Now set in individual views.
    
//    [self addContraints];
//    [self addConstraintsWithVisualFormat];
}

//    Now set in individual views.
- (void) addContraints
{
    self.topBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    // align top bar left to the frame's left.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    // align top bar right to the frame's right.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // align top bar top to the frame's top
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    // topBar height = 10.
    [self.topBar addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:10]];
    
    
    self.bottomRightSquare.translatesAutoresizingMaskIntoConstraints = NO;

    // bottomRightSquare width = 20.
    [self.bottomRightSquare addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    // bottomRightSquare height = 20.
    [self.bottomRightSquare addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    // align bottomRightSquare right to the frame's right.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // align bottomRightSquare bottom to the frame's bottom
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

}

//    Now set in individual views.
- (void) addConstraintsWithVisualFormat{
    
    self.topBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.bottomRightSquare.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    UIView *topBar = self.topBar;
    UIView *bottomRightSquare = self.bottomRightSquare;
    
    NSDictionary *variableBindings = NSDictionaryOfVariableBindings(topBar, bottomRightSquare);
    
    [self.frameView addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topBar]|" options:0 metrics:nil views:variableBindings]];
    [self.frameView addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topBar(10)]" options:0 metrics:nil views:variableBindings]];
    [self.frameView addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:[bottomRightSquare(20)]|" options:0 metrics:nil views:variableBindings]];
    [self.frameView addConstraints:
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomRightSquare(20)]|" options:0 metrics:nil views:variableBindings]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
