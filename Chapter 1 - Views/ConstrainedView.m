//
//  ConstrainedView.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ConstrainedView.h"
#import "NSLayoutConstraint+Listing.h"
#import "NSLayoutConstraint+Ambiguity.h"

@implementation ConstrainedView

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
//    NSLog(@"updateConstraints");
    
    }

-(void) layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews for %@",[self class]);
    [NSLayoutConstraint listConstraints:self];
    [NSLayoutConstraint reportAmbiguity:self];
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

@end
