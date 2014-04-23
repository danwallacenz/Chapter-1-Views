//
//  ConstraintsViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ConstraintsViewController.h"
#import "ConstrainedView.h"

@interface ConstraintsViewController ()

@property (strong, nonatomic) ConstrainedView *frameView;
@property (strong, nonatomic) ConstrainedView *topBar;
@property (strong, nonatomic) ConstrainedView *bottomRightSquare;
@property (strong, nonatomic) UIView *mainView;


@end

@implementation ConstraintsViewController

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
    
    self.frameView = [[ConstrainedView alloc] initWithFrame:CGRectMake(100, 111,132,194)];
    self.frameView.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
    self.topBar = [ConstrainedView new];
    self.topBar.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    
    self.bottomRightSquare = [ConstrainedView new];
    self.bottomRightSquare.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];

    [self.mainView addSubview:self.frameView];
    
    [self.frameView addSubview:self.topBar];
    [self.frameView addSubview:self.bottomRightSquare];
    
    [self addContraints];
}

- (void) addContraints
{
    self.topBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.bottomRightSquare.translatesAutoresizingMaskIntoConstraints = NO;
    
    // align top bar left to the frame's left.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    // align top bar right to the frame's right.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // align top bar top to the frame's top
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    // topBar height = 10.
    [self.topBar addConstraint:[NSLayoutConstraint constraintWithItem:self.topBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:10]];
    
   
    // bottomRightSquare width = 20.
    [self.bottomRightSquare addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    // bottomRightSquare height = 20.
    [self.bottomRightSquare addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    // align bottomRightSquare right to the frame's right.
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // align bottomRightSquare bottom to the frame's bottom
    [self.frameView addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomRightSquare attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.frameView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

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
