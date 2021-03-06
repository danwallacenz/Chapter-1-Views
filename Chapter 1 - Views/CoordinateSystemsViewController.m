//
//  CoordinateSystemsViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 9/07/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "CoordinateSystemsViewController.h"
#import "OverlayLayer.h"

@interface CoordinateSystemsViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueSquare;
@property (weak, nonatomic) IBOutlet UIView *redSquare;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property  (strong, nonatomic) OverlayLayer *overlayLayer;

@end

@implementation CoordinateSystemsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self loadTextView];
}

-(void)loadTextView
{
    NSString *blueSquareFrame = NSStringFromCGRect(self.blueSquare.frame);
    NSString *blueSquareOrigin = NSStringFromCGPoint(self.blueSquare.frame.origin);
    NSString *blueSquareBounds = NSStringFromCGRect(self.blueSquare.bounds);
    NSString *blueSquareCenter = NSStringFromCGPoint(self.blueSquare.center);
    
    NSString *redSquareFrame = NSStringFromCGRect(self.redSquare.frame);
    NSString *redSquareOrigin = NSStringFromCGPoint(self.redSquare.frame.origin);
    NSString *redSquareBounds = NSStringFromCGRect(self.redSquare.bounds);
    NSString *redSquareCenter = NSStringFromCGPoint(self.redSquare.center);
    
    
    NSString *blueSquareDescription = [NSString stringWithFormat:@" blueSquareFrame = %@\n blueSquareOrigin = %@\n blueSquareBounds = %@\n blueSquareCenter = %@\n\n",blueSquareFrame, blueSquareOrigin, blueSquareBounds, blueSquareCenter];
    
    NSString *redSquareDescription = [NSString stringWithFormat:@" redSquareFrame = %@\n redSquareOrigin = %@\n redSquareBounds = %@\n redSquareCenter = %@\n",redSquareFrame, redSquareOrigin, redSquareBounds, redSquareCenter];

    self.textView.text = [NSString stringWithFormat:@"%@%@",blueSquareDescription,redSquareDescription];
    
    self.overlayLayer = [OverlayLayer new];
    [self.view.layer addSublayer:  self.overlayLayer];
    [self.overlayLayer setNeedsDisplay];
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //convertPoint:fromView:
    //convertPoint:toView:
    //convertRect:fromView:
    //convertRect:toView:
    
//        NSLog(@"\n\n\nCONVERTING POINTS\n\n");
    
//    NSLog(@"\n\nself.blueSquare convertPoint: self.redSquare.frame.origin toView: self.blueSquare]=%@\n\n",NSStringFromCGPoint( [self.blueSquare convertPoint:self.redSquare.frame.origin toView:self.blueSquare]));
   
//    CGPoint p0 = [self.view convertPoint:self.redSquare.frame.origin toView:self.view];
//    NSLog(@"[\n\nself.view convertPoint: self.redSquare.frame.origin toView: self.view]=%@\n\n",NSStringFromCGPoint(p0));
    
//    CGPoint p1TO = [self.blueSquare convertPoint:self.redSquare.frame.origin toView:self.view];
//    NSLog(@"\n\n[self.blueSquare convertPoint: self.redSquare.frame.origin toView: self.view]=%@\n\n",NSStringFromCGPoint(p1TO));
//    
//    CGPoint p1FROM = [self.blueSquare convertPoint:self.redSquare.frame.origin fromView:self.view];
//    NSLog(@"\n\n[self.blueSquare convertPoint: self.redSquare.frame.origin fromView: self.view]=%@\n\n",NSStringFromCGPoint(p1FROM));
    
//    CGPoint p11 = [self.blueSquare convertPoint:self.redSquare.frame.origin fromView:self.view];
//    NSLog(@"[\n\nself.blueSquare convertPoint: self.redSquare.frame.origin fromView: self.view]=%@\n\n",NSStringFromCGPoint(p11));
    
//    CGPoint p2 = [self.redSquare convertPoint:self.redSquare.frame.origin toView:self.view];
//    NSLog(@"[\n\nself.redSquare convertPoint: self.redSquare.frame.origin toView: self.view]=%@\n\n",NSStringFromCGPoint(p2));
    
//    CGPoint p2TO = [self.blueSquare convertPoint:self.redSquare.frame.origin toView:self.blueSquare];
//    NSLog(@"\n\n[self.blueSquare convertPoint:self.redSquare.frame.origin toView:self.blueSquare]=%@\n\n",NSStringFromCGPoint(p2TO));
//    
//    CGPoint p2FROM = [self.blueSquare convertPoint:self.redSquare.frame.origin fromView:self.blueSquare];
//    NSLog(@"\n\n[self.blueSquare convertPoint:self.redSquare.frame.origin fromView:self.blueSquare=%@\n\n",NSStringFromCGPoint(p2FROM));
//    NSLog(@"\n\nself.blueSquare convertPoint: self.redSquare.frame.origin fromView: self.blueSquare]=%@\n\n",NSStringFromCGPoint( [self.blueSquare convertPoint:self.redSquare.frame.origin fromView:self.blueSquare]));
    
//    NSLog(@"[\n\nself.blueSquare convertPoint: self.redSquare.frame.origin fromView: self.view]=%@\n\n",NSStringFromCGPoint( [self.blueSquare convertPoint:self.redSquare.frame.origin fromView: self.view]));
    
    NSLog(@"\n\n\nCONVERTING RECTS\n\n");
    
    CGRect r1TO = [self.blueSquare convertRect:self.redSquare.frame toView:self.view];
    NSString *r1TOString = [NSString stringWithFormat: @"\n\n[self.blueSquare convertRect:self.redSquare.frame toView:self.view]=%@\n", NSStringFromCGRect(r1TO)];
    NSLog(@"%@", r1TOString);
    self.textView.text = [self.textView.text stringByAppendingString: r1TOString];
    
    CGRect r1FROM = [self.blueSquare convertRect:self.redSquare.frame fromView:self.view];
    NSLog(@"\n\n[self.blueSquare convertRect:self.redSquare.frame fromView:self.view]=%@\n\n",NSStringFromCGRect(r1FROM));
    

    CGRect r2TO = [self.blueSquare convertRect:self.redSquare.frame toView:self.blueSquare];
    NSString *r2TOString = [NSString stringWithFormat: @"\n[self.blueSquare convertRect:self.redSquare.frame toView:self.blueSquare]=%@\n", NSStringFromCGRect(r2TO)];
//    NSLog(@"\n\n[self.blueSquare convertRect:self.redSquare.frame toView:self.blueSquare]=%@\n\n",NSStringFromCGRect(r2TO));
    NSLog(@"%@", r2TOString);
    self.textView.text = [self.textView.text stringByAppendingString: r2TOString];
    
    CGRect r2FROM = [self.blueSquare convertRect:self.redSquare.frame fromView:self.blueSquare];
    NSLog(@"\n\n[self.blueSquare convertRect:self.redSquare.frame fromView:self.blueSquare];=%@\n\n",NSStringFromCGRect(r2FROM));
    
    CGRect r2TONIL = [self.blueSquare convertRect:self.redSquare.frame toView:nil];
    NSString *r2TONILString = [NSString stringWithFormat: @"\n[self.blueSquare convertRect:self.redSquare.frame toView:nil]=%@\n",NSStringFromCGRect(r2TONIL)];
//    NSLog(@"\n\n[self.blueSquare convertRect:self.redSquare.frame toView:nil]=%@\n\n",NSStringFromCGRect(r2TONIL));
    NSLog(@"%@", r2TONILString);
    self.textView.text = [self.textView.text stringByAppendingString: r2TONILString];


//    CGRect r2FROMNIL = [self.blueSquare convertRect:self.redSquare.frame fromView:nil];
//    NSLog(@"\n\n[self.blueSquare convertRect:self.redSquare.frame fromView:nil]=%@\n\n",NSStringFromCGRect(r2FROMNIL));
    
    NSLog(@"\n\n\nCONVERTING POINTS\n\n");
    
    CGPoint blueOriginInViewCoords = [self.view convertPoint:self.blueSquare.frame.origin toView: self.view];
    NSString *blueOriginInViewCoordsString = [NSString stringWithFormat: @"\n[self.view convertPoint:self.blueSquare.frame.origin toView: self.view]=%@\n", NSStringFromCGPoint(blueOriginInViewCoords)];
    NSLog(@"%@", blueOriginInViewCoordsString);
    self.textView.text = [self.textView.text stringByAppendingString: blueOriginInViewCoordsString];
    
    CGPoint redOriginInViewCoords = [self.blueSquare convertPoint:self.redSquare.frame.origin toView: self.view];
    NSString *redOriginInViewCoordsString = [NSString stringWithFormat: @"\n[self.blueSquare convertPoint:self.redSquare.frame.origin toView: self.view]=%@\n", NSStringFromCGPoint(redOriginInViewCoords)];
    NSLog(@"%@", redOriginInViewCoordsString);
    self.textView.text = [self.textView.text stringByAppendingString: redOriginInViewCoordsString];
    
    CGPoint redCenterInWindowCoords = [self.blueSquare convertPoint:self.redSquare.center toView: nil];
    NSString *redCenterInWindowCoordsString = [NSString stringWithFormat: @"\n[self.blueSquare convertPoint:self.redSquare.center toView: nil]=%@\n\n", NSStringFromCGPoint(redCenterInWindowCoords)];
    NSLog(@"%@", redCenterInWindowCoordsString);
    self.textView.text = [self.textView.text stringByAppendingString: redCenterInWindowCoordsString];
}
@end
