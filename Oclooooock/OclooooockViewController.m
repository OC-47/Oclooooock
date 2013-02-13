//
//  OclooooockViewController.m
//  Oclooooock
//
//  Created by Miwa Oshiro on 2013/02/11.
//  Copyright (c) 2013年 edu.stanford.cs193p.oshiro. All rights reserved.
//

#import "OclooooockViewController.h"

#define IMAGE_HEADER @"ishot-"
#define IMAGE_TYPE   @"png"
#define IMAGE_COUNT  600

@interface OclooooockViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation OclooooockViewController

@synthesize imageView;
@synthesize label;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateDateAndImage];
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(updateDateAndImage)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) updateDateAndImage
{
    [self showImage];
    [self showDate];
}


- (void) showImage
{
    static int imageIndex = 1;

    NSBundle *bundle = [NSBundle mainBundle];
    NSMutableString *imageName = [NSMutableString string];
    [imageName appendString:IMAGE_HEADER];
    [imageName appendFormat:@"%d",imageIndex];
    NSString *path = [bundle pathForResource:imageName ofType:@"png"];
    imageView.image = [[UIImage alloc]initWithContentsOfFile:path];

    imageIndex = (imageIndex + 1) % IMAGE_COUNT;


}

- (void) showDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    [label setText:[formatter stringFromDate:[NSDate date]]];

}


@end
