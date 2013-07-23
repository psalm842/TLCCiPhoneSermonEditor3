//
//  SermonSeriesViewController.h
//  LeagueManager
//
//  Created by Jessi on 7/6/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SermonSeriesTableViewController;

@interface SermonSeriesViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *seriesName;
@property (nonatomic, weak) IBOutlet UITextField *sermonSeriesImageURL;
@property (nonatomic, strong) NSManagedObject *sermonSeries;
@property (nonatomic, strong) SermonSeriesTableViewController *rootController;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
