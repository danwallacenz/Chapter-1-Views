//
//  NSLayoutConstraint+Listing.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "NSLayoutConstraint+Listing.h"

@implementation NSLayoutConstraint (Listing)

+ (void) listConstraints:(UIView *)v
{
    if (nil == v) {
        v = [[UIApplication sharedApplication] keyWindow];
    }
    NSLog(@"Layout constraints for %@", [v class]);
    for (UIView *subview in v.subviews) {
        NSArray *horizontalConstraints = [subview constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal];
        NSArray *verticalConstraints = [subview constraintsAffectingLayoutForAxis:UILayoutConstraintAxisVertical];
        NSLog(@"%@\nH: %@\nV:%@", [subview class], horizontalConstraints, verticalConstraints);
        if(subview.subviews.count){
            [self listConstraints:subview];
        }
    }
}

@end
