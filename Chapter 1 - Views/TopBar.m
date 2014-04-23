//
//  TopBar.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "TopBar.h"

@implementation TopBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

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
    
//    [self setConstraints];
    [self setConstraintsWithVisualFormat];
    
}
- (void) setConstraints
{
    // align top bar left to the frame's left.
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    // align top bar right to the frame's right.
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    // align top bar top to the frame's top
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    // topBar height = 10.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:10]];
}

- (void) setConstraintsWithVisualFormat
{

    
    NSDictionary *variableBindings = NSDictionaryOfVariableBindings(self);
    
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:nil views:variableBindings]];
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self(10)]" options:0 metrics:nil views:variableBindings]];
}

@end
