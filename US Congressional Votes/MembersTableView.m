//
//  MembersTableView.m
//  US Congressional Votes
//
//  Created by David Collins on 1/5/14.
//  Copyright (c) 2014 David Collins. All rights reserved.
//

#import "MembersTableView.h"

@implementation MembersTableView

@synthesize members;

// don't need this outside of this class
NSArray *searchedMembers;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [members objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [members count];
}

- (void) setMembers:(NSMutableArray *)members
{
    self.members = members;
}

@end
