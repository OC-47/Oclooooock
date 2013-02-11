//
//  OclooooockViewController.m
//  Oclooooock
//
//  Created by Miwa Oshiro on 2013/02/11.
//  Copyright (c) 2013年 edu.stanford.cs193p.oshiro. All rights reserved.
//

#import "OclooooockViewController.h"

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
    [self startAnimation];
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(showDate)
                                   userInfo:nil
                                    repeats:YES];
}


- (void) startAnimation{
    
    NSMutableArray *imgBox = [[NSMutableArray alloc]init];
    
    for(int i=37; i<636; i++){

        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:[NSString stringWithFormat:@"ishot-%d",i]ofType:@"png"];
        [imgBox addObject:[[UIImage alloc]initWithContentsOfFile:path]];
    }
    
    imageView.animationImages = imgBox;
    imageView.animationDuration = imgBox.count;


    
    [imageView startAnimating];

}

- (void) showDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    [label setText:[formatter stringFromDate:[NSDate date]]];

}


@end
