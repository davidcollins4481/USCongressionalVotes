//
//  DMCFirstViewController.m
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "DMCFirstViewController.h"

@interface DMCFirstViewController ()

@end

@implementation DMCFirstViewController

@synthesize senateView, houseView;

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

- (IBAction)segmentValueChanged:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        // show senate view
        case 0:
            self.senateView.hidden = NO;
            self.houseView.hidden = YES;
            break;
        // show house view
        case 1:
            self.senateView.hidden = YES;
            self.houseView.hidden = NO;
            break;
        default:
            break;
    }
}

@end
