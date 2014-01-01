//
//  RepCell.m
//  US Congressional Votes
//
//  Created by David Collins on 12/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "RepCell.h"

@implementation RepCell

@synthesize name = _name;
@synthesize party = _party;
@synthesize state = _state;
@synthesize district = _district;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
