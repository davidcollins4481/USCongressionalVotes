//
//  MembersTableView.h
//  US Congressional Votes
//
//  Created by David Collins on 1/5/14.
//  Copyright (c) 2014 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MembersTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) NSMutableArray *members;
- (void) setMembers:(NSMutableArray *)members;

@end
