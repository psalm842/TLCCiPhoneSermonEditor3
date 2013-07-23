//
//  SermonViewController.h
//  LeagueManager
//
//  Created by Jessi on 7/16/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SermonSeriesTableViewController;

@interface SermonViewController : UIViewController <UIActionSheetDelegate>

@property (nonatomic, weak) IBOutlet UITextField *sermonTitle;
@property (nonatomic, weak) IBOutlet UITextField *description;
@property (nonatomic, weak) IBOutlet UITextField *videourl;
@property (nonatomic, strong) NSManagedObject *sermonSeries;
@property (nonatomic, strong) NSManagedObject *sermon;
@property (nonatomic, strong) SermonSeriesTableViewController *rootController;

- (void)initWithRootController:(SermonSeriesTableViewController *)aRootController sermonSeries:(NSManagedObject *)sermonSeries sermon:(NSManagedObject *)sermon;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)confirmDelete:(id)sender;

@end
