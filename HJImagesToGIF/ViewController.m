//
//  ViewController.m
//  HJImagesToGIF
//
//  Created by Harrison Jackson on 8/6/13.
//  Copyright (c) 2013 Harrison Jackson. All rights reserved.
//

#import "ViewController.h"
#import "HJImagesToGIF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testBtnClicked:(id)sender {
    NSString *tempPath = [NSHomeDirectory() stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"puppy.gif"]];
    
    NSArray * images = [NSArray arrayWithObjects:[UIImage imageNamed:@"frame1.png"],
                        [UIImage imageNamed:@"frame2.png"],
                        [UIImage imageNamed:@"frame3.png"],
                        [UIImage imageNamed:@"frame4.png"],
                        [UIImage imageNamed:@"frame5.png"],
                        [UIImage imageNamed:@"frame6.png"], nil];
    
    [HJImagesToGIF saveGIFFromImages:images toPath:tempPath WithCallbackBlock:^{
        self.resultImage.animationImages = images;
        self.resultImage.animationRepeatCount = 5;
        [self.resultImage startAnimating];
    }];
    
    [HJImagesToGIF saveGIFToPhotoAlbumFromImages:images WithCallbackBlock:^{
        NSLog(@"Save to album!");
        
    }];

    
}
@end
