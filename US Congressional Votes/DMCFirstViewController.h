//
//  DMCFirstViewController.h
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYTCongress.h"

@interface DMCFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *senateView;
@property (weak, nonatomic) IBOutlet UIView *houseView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *senateTableView;
@property (weak, nonatomic) IBOutlet UITableView *houseTableView;

@property NSString *searchID;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;

- (IBAction)segmentValueChanged:(id)sender;

@end
