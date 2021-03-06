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

- (void)updateConstraints
{
    [super updateConstraints];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews for %@",[self class]);
    [NSLayoutConstraint reportAmbiguity:self];
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

@end
