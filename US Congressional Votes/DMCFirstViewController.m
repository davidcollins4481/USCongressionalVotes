//
//  DMCFirstViewController.m
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "DMCFirstViewController.h"
#import <UIKit/UIKit.h>
#import "NYTHouseOfRepresentatives.h"
#import "NYTSenate.h"

@interface DMCFirstViewController ()

@end

@implementation DMCFirstViewController

@synthesize senateView, houseView, senateTableView, houseTableView;

// these are going away
NSArray *houseMembers, *senators;

NYTHouseOfRepresentatives *house;
NYTSenate *senate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_semaphore_t holdOn = dispatch_semaphore_create(0);

    senate = [[NYTSenate alloc] initWithCallbacksOnSuccess:
              ^(NSURLResponse* response, NSData* urlData) {
                  dispatch_semaphore_signal(holdOn);
              }
              onError: ^(NSURLResponse* response, NSError *error) {
                  dispatch_semaphore_signal(holdOn);
              }];
    
    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);

    house = [[NYTHouseOfRepresentatives alloc] initWithCallbacksOnSuccess:
             ^(NSURLResponse* response, NSData* urlData) {
                 dispatch_semaphore_signal(holdOn);
             }
             onError: ^(NSURLResponse* response, NSError *error) {
                 dispatch_semaphore_signal(holdOn);
             }];
    
    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);

    houseMembers = [house getMembers];
    senators = [senate getMembers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    if (tableView == self.senateTableView) {
        NYTMember *senator = [senators objectAtIndex: indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat: @"%@, %@", [senator lastName],[senator firstName] ];
    } else if (tableView == self.houseTableView) {
        NYTMember *rep = [houseMembers objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat: @"%@, %@", [rep lastName],[rep firstName] ];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [houseMembers count];
}

/* events */
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
