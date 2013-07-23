//
//  SermonSeriesTableViewController.h
//  LeagueManager
//
//  Created by Jessi on 7/5/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SermonSeriesTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void) insertSermonSeriesWithName:(NSString *)seriesname sermonseriesimageurl:(NSString *)sermonseriesimageurl;
- (void) saveContext;
- (void)insertSermonWithSermonSeries:(NSManagedObject *)sermonSeries title:(NSString *)title description:(NSString *)description videourl:(NSString *)videourl;
- (void)deletesermon:(NSManagedObject *)sermon;

@end
