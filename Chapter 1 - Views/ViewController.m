//
//  ViewController.m
//  Chapter 1 - Views
//
//  Created by Daniel Wallace [DATACOM] on 22/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *smallRedSquare;

@property (strong, nonatomic) UIView *purpleRect;
@property (strong, nonatomic) UIView *greenRect;
@property (strong, nonatomic) UIView *redRect;

@property (strong, nonatomic) UIView *purpleFrame;
@property (strong, nonatomic) UIView *greenInset;

@property (strong, nonatomic) UIView *transformPurpleFrame;
@property (strong, nonatomic) UIView *transformGreenInset;

@property (weak, nonatomic) IBOutlet UISlider *smallRedSquareViewAlphaSlider;

@property (weak, nonatomic) IBOutlet UILabel *insetsLabel;

@property (weak, nonatomic) IBOutlet UILabel *boundsOriginXLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsOriginYLabel;

@property (weak, nonatomic) IBOutlet UISlider *scaleFrameHorizontallySlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleFrameVerticallySleder;

@property (weak, nonatomic) IBOutlet UISlider *scaleContentsVerticallySlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleContentsHorizontallySlider;

@property (weak, nonatomic) IBOutlet UISlider *translateContentsVerticallySlider;
@property (weak, nonatomic) IBOutlet UISlider *translateContentsHorizontallySlider;

@end

@implementation ViewController


#pragma mark - transform actions
- (IBAction)rotateFrame:(UISlider *)sender
{
    self.transformPurpleFrame.transform = CGAffineTransformMakeRotation(sender.value * M_PI/180.0);
}

- (IBAction)scaleFrameHorizontally:(UISlider *)sender {
    self.transformPurpleFrame.transform = CGAffineTransformMakeScale(sender.value, self.scaleFrameVerticallySleder.value);
}

- (IBAction)scaleFrameVertically:(UISlider *)sender {
    self.transformPurpleFrame.transform = CGAffineTransformMakeScale(self.scaleFrameHorizontallySlider.value, sender.value);
}

- (IBAction)scaleContentsVertically:(UISlider *)sender {
    self.transformGreenInset.transform = CGAffineTransformMakeScale(self.scaleContentsHorizontallySlider.value, sender.value);
}

- (IBAction)scaleContentsHorizontally:(UISlider *)sender {
    self.transformGreenInset.transform = CGAffineTransformMakeScale(sender.value, self.scaleContentsVerticallySlider.value);
}

- (IBAction)translateContentsVertically:(UISlider *)sender {
    self.transformGreenInset.transform = CGAffineTransformMakeTranslation(self.translateContentsHorizontallySlider.value, sender.value);
}

- (IBAction)translateContentsVHorizontally:(UISlider *)sender {
    self.transformGreenInset.transform = CGAffineTransformMakeTranslation(sender.value, self.translateContentsVerticallySlider.value);
}

- (IBAction)rotateContents:(UISlider *)sender {
    self.transformGreenInset.transform = CGAffineTransformMakeRotation(sender.value * M_PI/180.0);
}

- (IBAction)shearFrame:(UISlider *)sender {
    self.transformPurpleFrame.transform = CGAffineTransformMake(1, 0, -sender.value, 1, 0, 0);
}

- (IBAction)shearContents:(UISlider *)sender {
     self.transformGreenInset.transform = CGAffineTransformMake(1, 0, -sender.value, 1, 0, 0);
}

#pragma mark - bounds origin actions
- (IBAction)purpleRectClipsToBoundsSwitched:(UISwitch *)sender
{
    self.purpleFrame.clipsToBounds = !self.purpleFrame.clipsToBounds;
}

- (IBAction)boundsOriginXChanged:(UISlider *)sender
{
    CGRect purpleFrameBounds =  self.purpleFrame.bounds;
    purpleFrameBounds.origin.x = sender.value;
    self.purpleFrame.bounds = purpleFrameBounds;
    
    self.boundsOriginXLabel.text = [NSString stringWithFormat:@"origin x:%f",self.purpleFrame.bounds.origin.x];
    [self.greenInset.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addCenterMark: self.self.greenInset];
}

- (IBAction)boundsOriginYChanged:(UISlider *)sender
{
    CGRect purpleFrameBounds =  self.purpleFrame.bounds;
    purpleFrameBounds.origin.y = sender.value;
    self.purpleFrame.bounds = purpleFrameBounds;
    
    self.boundsOriginYLabel.text = [NSString stringWithFormat:@"origin y:%f", self.purpleFrame.bounds.origin.y];
    [self.greenInset.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addCenterMark: self.self.greenInset];
}


#pragma mark - CGRectInsets actions
- (IBAction)greenInsetCGRectInsetsChanged:(UISlider *)sender
{
    
//    self.greenInset.frame = CGRectInset(self.purpleFrame.bounds, sender.value, sender.value);
    self.greenInset.bounds = CGRectInset(self.purpleFrame.bounds, sender.value, sender.value);
    
    [self.greenInset.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addCenterMark: self.self.greenInset];
    
//    [self addCenterMark: self.self.purpleFrame];
    
    self.insetsLabel.text = [NSString stringWithFormat:@"%f", sender.value];

}


#pragma mark - large red rectangle actions
- (IBAction)largeRedRectangleRemoveAddSwitch:(UISwitch *)sender
{
    if(self.redRect.superview){
        [self.redRect removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.redRect];
    }
}

#pragma mark - purple rectangle actions
- (IBAction)purpleRectangleRemoveAddSwitch:(UISwitch *)sender
{

    if(self.purpleRect.superview){
        [self.purpleRect removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.purpleRect];
    }
}

- (IBAction)purpleRectangleViewAlphaChanged:(UISlider *)sender
{
    self.purpleRect.alpha = sender.value;
}

- (IBAction)purpleRectangleClipToBounds:(UISwitch *)sender
{
    self.purpleRect.clipsToBounds = !self.purpleRect.clipsToBounds;
}

#pragma mark - Small red square actions
- (IBAction)smallRedSquareRemoveAddSwitch:(UISwitch *)sender
{

    if(self.smallRedSquare.superview){
        [self.smallRedSquare removeFromSuperview];
    }else{
        UIView* mainView = self.view;
        [mainView addSubview: self.smallRedSquare];
    }
}

- (IBAction)smallRedSquareViewAlphaChanged:(UISlider *)sender
{
    
    NSLog(@"Setting small red square VIEW alpha to %f", sender.value);
    self.smallRedSquare.alpha = sender.value;
     NSLog(@"Actual alpha is %f", self.smallRedSquare.alpha*sender.value);
}

- (IBAction)smallRedSquareColorAlphaChanged:(UISlider *)sender
{
    
    NSLog(@"Setting small red square BACKGROUND COLOR` alpha to %f", sender.value);
    self.smallRedSquare.backgroundColor = [self.smallRedSquare.backgroundColor colorWithAlphaComponent:sender.value];
    NSLog(@"Actual alpha is %f", self.smallRedSquare.alpha*sender.value);
}

#pragma mark - UIViewController methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addSmallRedSquare];
    
    [self addOverlappingViews];
    
    [self addInsetRect];
    
    [self addTransformsRects];
    
    // In debugger console enter 'po [self.view recursiveDescription]'
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - add views
-(void) addSmallRedSquare
{
    UIView* mainView = self.view;
    self.smallRedSquare = [[UIView alloc] initWithFrame: CGRectMake(100,100,50,50)];
    self.smallRedSquare.backgroundColor = [UIColor redColor];
    
    [mainView addSubview: self.smallRedSquare];
    [self addCenterMark: self.smallRedSquare];
    
    [self logView: mainView name: @"mainView"];
    
    [self logView: self.smallRedSquare name: @"smallRedSquare"];
}

- (void) addOverlappingViews
{
//    CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
    
    self.purpleRect = [[UIView alloc] initWithFrame: CGRectMake(113, 111, 132, 194)];
    self.purpleRect.backgroundColor = [UIColor colorWithRed:1 green: .4 blue: 1 alpha: 1];
    
    self.greenRect = [[UIView alloc] initWithFrame: CGRectMake(41, 56, 132, 194)];
    self.greenRect.backgroundColor = [UIColor colorWithRed: .5 green: 1 blue: 0 alpha: 1];
    
    self.redRect = [[UIView alloc] initWithFrame: CGRectMake(43, 197, 160, 230)];
    self.redRect.backgroundColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: .6];
    
    UIView* mainView = self.view;
    [mainView addSubview: self.purpleRect];
    [self.purpleRect addSubview:self.greenRect];
    [mainView addSubview:self.redRect];
    
    [self addCenterMark: self.purpleRect];
    [self addCenterMark: self.greenRect];
    [self addCenterMark: self.redRect];
    
    [self logView: self.purpleRect name: @"purpleRect"];
    [self logView: self.greenRect name: @"greenRect"];
    [self logView: self.redRect name: @"redRect"];
    
}

-(void) addInsetRect
{
    self.purpleFrame = [[UIView alloc] initWithFrame:CGRectMake(313, 111, 132, 194)];
    self.purpleFrame.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
//    CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
    
    self.greenInset = [[UIView alloc] initWithFrame:CGRectInset(self.purpleFrame.bounds, 10, 10)];
    self. greenInset.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:.8];
    
    UIView* mainView = self.view;
    [mainView addSubview:self.purpleFrame];
    [self.purpleFrame addSubview:self.greenInset];
    [self addCenterMark:self.greenInset];
    [self addCenterMark:self.purpleFrame];
    
    [self logView:self.purpleFrame name:@"purpleFrame"];
    [self logView:self.greenInset name:@"greenInset"];
}

-(void) addTransformsRects
{
    self.transformPurpleFrame = [[UIView alloc] initWithFrame:CGRectMake(43, 450, 160, 230)];
    self.transformPurpleFrame.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
    //    CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
    
    self.transformGreenInset = [[UIView alloc] initWithFrame:CGRectInset(self.transformPurpleFrame.bounds, 10, 10)];
    self. transformGreenInset.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:.8];
    
    UIView* mainView = self.view;
    [mainView addSubview:self.transformPurpleFrame];
    [self.transformPurpleFrame addSubview:self.transformGreenInset];
    
    [self addCenterMark:self.transformGreenInset];
    [self addCenterMark:self.transformPurpleFrame];
    
    [self logView:self.transformPurpleFrame name:@"transformPurpleFrame"];
    [self logView:self.transformGreenInset name:@"transformGreenInset"];
}


#pragma mark -  utility methods
- (void)logView: (UIView*)v name: (NSString*) name
{
    NSLog(@"%@ frame origin.x = %f", name, v.frame.origin.x);
    NSLog(@"%@ frame origin.y = %f", name, v.frame.origin.y);
    NSLog(@"%@ frame size.height = %f", name, v.frame.size.height);
    NSLog(@"%@ frame size.width = %f", name, v.frame.size.width);
    
    NSLog(@"%@ bounds origin.x = %f", name, v.bounds.origin.x);
    NSLog(@"%@ bounds origin.y = %f", name, v.bounds.origin.y);
    NSLog(@"%@ bounds size.height = %f", name, v.bounds.size.height);
    NSLog(@"%@ bounds size.width = %f", name, v.bounds.size.width);
    
    NSLog(@"%@ center.x = %f", name, v.center.x);
    NSLog(@"%@ center.y = %f", name, v.center.y);
}

- (void) addCenterMark: (UIView*)v
{
    CGPoint center = [v convertPoint:v.center fromView:v.superview];

    CGRect centerRect = CGRectMake(0, 0, 4, 4);

    UIView *centerPoint = [[UIView alloc] initWithFrame: centerRect];
    centerPoint.center = center;
    
    centerPoint.backgroundColor = [UIColor blackColor];
    
    [v addSubview:centerPoint];
}

@end
