//
//  BottomSquare.h
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 23/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ConstrainedView.h"

@interface BottomSquare : ConstrainedView

-(void) updateDistanceOfRedSquareFromRHS: (CGFloat) distance;

-(void) updateDistanceOfRedSquareFromBottom: (CGFloat) distance;

@end
