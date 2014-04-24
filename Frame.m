//
//  Frame.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "Frame.h"
#import "NSLayoutConstraint+Listing.h"
#import "NSLayoutConstraint+Ambiguity.h"

@implementation Frame

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
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [super updateConstraints];
    NSLog(@"updateConstraints for %@", [self class]);
    
    [self setConstraints];
}

- (void) setConstraints
{
    //    self.frameView = [[Frame alloc] initWithFrame:CGRectMake(100, 111,132,194)];
    
[NSLayoutConstraint listConstraints:self];
    
    // align frame left to the view's's left.
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:100]];

    // align frame top to the frame's top
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:194]];
    // frame height = 132.
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:194]];
    
    // frame width = 194.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:132]];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews for %@",[self class]);
    [NSLayoutConstraint listConstraints:self];
    [NSLayoutConstraint reportAmbiguity:self.superview];
}


@end
