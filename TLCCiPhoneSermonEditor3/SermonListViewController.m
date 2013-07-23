//
//  SermonListViewController.m
//  LeagueManager
//
//  Created by Jessi on 7/12/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import "SermonListViewController.h"
#import "SermonViewController.h"

@implementation SermonListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sermons";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [(NSSet *)[_sermonSeries valueForKey:@"seriestosermon"] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSManagedObject *sermon = [[self sortSermons] objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[[sermon valueForKey:@"sermontitle"] description],[[sermon valueForKey:@"sermondescription"] description]];
    
    cell.detailTextLabel.text = [[sermon valueForKey:@"videourl"] description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



#pragma mark - Instance Methods
- (NSArray *)sortSermons
{
    NSSortDescriptor *sortLastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sermondescription" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortLastNameDescriptor, nil];
    return [[(NSSet *)[_sermonSeries valueForKey:@"seriestosermon"] allObjects] sortedArrayUsingDescriptors:sortDescriptors];
}



#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSManagedObject *sermon = nil;
    
    if ([[segue identifier] isEqualToString:@"EditSermonSegue"]) {
        sermon = [[self sortSermons] objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    }
    
    [[segue destinationViewController] initWithRootController:_rootController sermonSeries:_sermonSeries sermon:sermon];
}

@end
