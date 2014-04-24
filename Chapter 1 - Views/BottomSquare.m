//
//  BottomSquare.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "BottomSquare.h"
#import "NSLayoutConstraint+Listing.h"

@interface BottomSquare ()

@property (strong, nonatomic) NSLayoutConstraint *distanceFromRightSideConstraint;

//@property CGFloat distanceOfBottomRedSquareFromRightSide;

@end

@implementation BottomSquare

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
//    self.distanceFromRightSideConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    self.distanceOfBottomRedSquareFromRightSide = 0;
    
    return self;
}

-(void) updateDistanceOfRedSquareFromRHS: (CGFloat) distance
{
    self.distanceOfBottomRedSquareFromRightSide = distance;
    [self setNeedsUpdateConstraints];
}

//- (void) setDistanceOfBottomRedSquareFromRightSide:(CGFloat) distance
//{
//    distanceOfBottomRedSquareFromRightSide = distance;
//    self.distanceFromRightSideConstraint.constant = self.distanceOfBottomRedSquareFromRightSide;
//    [self setNeedsUpdateConstraints];
//}
//
//-(CGFloat) distanceOfBottomRedSquareFromRightSide
//{
//    return self.distanceOfBottomRedSquareFromRightSide;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)updateConstraints
{
    [super updateConstraints];
    NSLog(@"updateConstraints for %@", [self class]);
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self setConstraints];
    
//    [self setConstraintsWithVisualFormat];
}

- (void) setConstraints{
    // bottomRightSquare width = 20.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    // bottomRightSquare height = 20.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    
    // align bottomRightSquare right to the frame's right.
//    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    NSLog(@"distanceOfBottomRedSquareFromRightSide=%f", self.distanceOfBottomRedSquareFromRightSide);
    
    
    if(!self.distanceFromRightSideConstraint){
        self.distanceFromRightSideConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:self.distanceOfBottomRedSquareFromRightSide];

//                self.distanceFromRightSideConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
        
    }

    self.distanceFromRightSideConstraint.constant = -self.distanceOfBottomRedSquareFromRightSide;
    
    [self.superview addConstraint:self.distanceFromRightSideConstraint];
    
    // align bottomRightSquare bottom to the frame's bottom
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    [self.superview removeConstraint:self.distanceFromRightSideConstraint];
    [self.superview addConstraint:self.distanceFromRightSideConstraint];
    [super layoutSubviews];
    
}

- (void) setConstraintsWithVisualFormat
{
    
    NSDictionary *variableBindings = NSDictionaryOfVariableBindings(self);
    
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[self(20)]|" options:0 metrics:nil views:variableBindings]];
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[self(20)]|" options:0 metrics:nil views:variableBindings]];
}

@end
