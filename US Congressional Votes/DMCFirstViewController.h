//
//  DMCFirstViewController.h
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMCFirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *senateView;
@property (weak, nonatomic) IBOutlet UIView *houseView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentValueChanged:(id)sender;

@end
