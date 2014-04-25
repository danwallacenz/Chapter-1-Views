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
    CGFloat HEIGHT = 194;
    CGFloat WIDTH = 132;
    CGFloat ORIGIN_X = 100;
    CGFloat ORIGIN_Y = 111;
    
    // align frame left to the view's's left.
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:ORIGIN_X + WIDTH/2]];

    // align frame top to the frame's top
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:ORIGIN_Y + HEIGHT/2]];

    // frame height = 194.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:HEIGHT]];
    
    // frame width = 132.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:WIDTH]];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews for %@",[self class]);
    [NSLayoutConstraint listConstraints:self];
    [NSLayoutConstraint reportAmbiguity:self.superview];
    
//    po [[UIWindow keyWindow] _autolayoutTrace];
}


@end
