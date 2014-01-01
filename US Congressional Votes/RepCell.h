//
//  RepCell.h
//  US Congressional Votes
//
//  Created by David Collins on 12/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *party;
@property (nonatomic, weak) IBOutlet UILabel *state;
@property (nonatomic, weak) IBOutlet UILabel *district;

@end
