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
#import "SenatorCell.h"
#import "RepCell.h"

@interface DMCFirstViewController ()

@end

@implementation DMCFirstViewController

@synthesize senateView, houseView, senateTableView, houseTableView;

NSArray *houseMembers, *senators, *searchedHouseMembers, *searchedSenators;

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
    //UITableView *search = self.searchDisplayController;
   // if (tableView == self.searchDisplayController) {
        
   // }
    
    if (tableView == self.senateTableView) {
        static NSString *cellTableIdentifier = @"SenatorCell";
        SenatorCell *cell = (SenatorCell *)[tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
        NYTSenator *senator = [senators objectAtIndex: indexPath.row];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.state.text = [senator state];
        cell.name.text = [senator nameString];
        cell.party.text = [senator party];
        return cell;
    } else if (tableView == self.houseTableView) {
        static NSString *cellTableIdentifier = @"RepCell";
        RepCell *cell = (RepCell *)[tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
        NYTHouseRepresentative *rep = [houseMembers objectAtIndex:indexPath.row];
        cell = (RepCell *)[tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.state.text = [rep state];
        cell.name.text = [rep nameString];
        cell.district.text = [rep districtString];
        return cell;
    }
    
    // shouldn't happen
    return NULL;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"HA! caught you trying to set undefined key %@ to %@",key,value);
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
/*
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchedSenators = [senators filteredArrayUsingPredicate:resultPredicate];
}*/

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
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath row] * 20;
}*/
@end
