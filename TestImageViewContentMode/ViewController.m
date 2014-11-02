//
//  ViewController.m
//  TestImageViewContentMode
//
//  Created by LiYunFeng on 14-10-24.
//  Copyright (c) 2014年 sogou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *_imageView;
    NSTimer *_timer;
    UIImage *_oriImage;
}

@end

/*
 typedef NS_ENUM(NSInteger, UIViewContentMode) {
 UIViewContentModeScaleToFill,
 UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
 UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
 UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
 UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
 UIViewContentModeTop,
 UIViewContentModeBottom,
 UIViewContentModeLeft,
 UIViewContentModeRight,
 UIViewContentModeTopLeft,
 UIViewContentModeTopRight,
 UIViewContentModeBottomLeft,
 UIViewContentModeBottomRight,
 };
 
 typedef NS_ENUM(NSInteger, UIImageOrientation) {
 UIImageOrientationUp,            // default orientation
 UIImageOrientationDown,          // 180 deg rotation
 UIImageOrientationLeft,          // 90 deg CCW
 UIImageOrientationRight,         // 90 deg CW
 UIImageOrientationUpMirrored,    // as above but image mirrored along other axis. horizontal flip
 UIImageOrientationDownMirrored,  // horizontal flip
 UIImageOrientationLeftMirrored,  // vertical flip
 UIImageOrientationRightMirrored, // vertical flip
 };
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 40, 50)];
    _imageView.backgroundColor = [UIColor grayColor];
    _oriImage = [UIImage imageNamed:@"a"];
    _imageView.image = _oriImage;
    [self.view addSubview:_imageView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(modeChanged) userInfo:nil repeats:YES];
}

- (void)modeChanged
{
//    NSArray *array = @[@(UIViewContentModeScaleToFill),
//                       @(UIViewContentModeScaleAspectFit),
//                       @(UIViewContentModeScaleAspectFill),
//                       @(UIViewContentModeCenter),
//                       @(UIViewContentModeTop),
//                       @(UIViewContentModeBottom),
//                       @(UIViewContentModeLeft),
//                       @(UIViewContentModeRight),
//                       @(UIViewContentModeTopLeft),
//                       @(UIViewContentModeTopRight),
//                       @(UIViewContentModeBottomLeft),
//                       @(UIViewContentModeBottomRight),];
    
    NSArray *array = @[@(UIImageOrientationUp),
                       @(UIImageOrientationDown),
                       @(UIImageOrientationLeft),
                       @(UIImageOrientationRight),
                       @(UIImageOrientationUpMirrored),
                       @(UIImageOrientationDownMirrored),
                       @(UIImageOrientationLeftMirrored),
                       @(UIImageOrientationRightMirrored)];

    
    static int i = 0;
    if (i >= [array count]) {
        [_timer invalidate];
        return;
    }
//    NSNumber *number = array[i];
//    _imageView.contentMode = number.intValue;
    
//    _imageView.image = [UIImage imageWithCGImage:_oriImage.CGImage scale:_oriImage.scale orientation:number.intValue];
//    _imageView.transform = CGAffineTransformMakeRotation(2*M_PI/[array count]*i);
    i++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
