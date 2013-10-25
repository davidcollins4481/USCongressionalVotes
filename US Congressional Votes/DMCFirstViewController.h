//
//  DMCFirstViewController.h
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMCFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *senateView;
@property (weak, nonatomic) IBOutlet UIView *houseView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *senateTableView;
@property (weak, nonatomic) IBOutlet UITableView *houseTableView;

- (IBAction)segmentValueChanged:(id)sender;

@end
