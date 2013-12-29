//
//  DMCFirstViewController.m
//  US Congressional Votes
//
//  Created by David Collins on 9/5/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "DMCFirstViewController.h"
#import <UIKit/UIKit.h>

@interface DMCFirstViewController ()

@end

@implementation DMCFirstViewController

@synthesize senateView, houseView, senateTableView, houseTableView;

NSArray *tableData, *tableDataTwo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // senate
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    // house
    tableDataTwo = [NSArray arrayWithObjects:@"asdfsd", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
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
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    } else if (tableView == self.houseTableView) {
        cell.textLabel.text = [tableDataTwo objectAtIndex:indexPath.row];
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
    return [tableData count];
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
