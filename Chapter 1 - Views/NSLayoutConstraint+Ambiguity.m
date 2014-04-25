//
//  NSLayoutConstraint+Ambiguity.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "NSLayoutConstraint+Ambiguity.h"

@implementation NSLayoutConstraint (Ambiguity)

+ (void) reportAmbiguity: (UIView*) v
{
    if(nil == v){
        v = [[UIApplication sharedApplication] keyWindow];
    }
    
    for (UIView *subview in v.subviews) {
        
        if(subview.hasAmbiguousLayout){
            NSLog(@"Ambiguous layout: %@ %d", subview, subview.hasAmbiguousLayout);
        }
        
        if(subview.subviews.count){
            [self reportAmbiguity:subview];
        }
    }
}

@end
