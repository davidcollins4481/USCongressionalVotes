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

NSArray *tableData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [senateTableView registerNib:[UINib nibWithNibName:@"RepCell" bundle:nil]
    //      forCellReuseIdentifier:@"cell"];
    
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    //[senateTableView cellForRowAtIndexPath:0];
    [senateTableView setDelegate:self];
    [senateTableView setDataSource:self];
    [self.view addSubview: senateTableView];

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
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];

    if (tableView == self.senateTableView) {
        
    } else {
        // house view selected
    }
    return cell;
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
