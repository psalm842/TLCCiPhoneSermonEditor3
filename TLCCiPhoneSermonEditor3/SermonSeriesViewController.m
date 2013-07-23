//
//  SermonSeriesViewController.m
//  LeagueManager
//
//  Created by Jessi on 7/6/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import "SermonSeriesViewController.h"
#import "SermonSeriesTableViewController.h"

@implementation SermonSeriesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_sermonSeries)
    {
        _seriesName.text = [_sermonSeries valueForKey:@"seriesname"];
        _sermonSeriesImageURL.text = [_sermonSeries valueForKey:@"sermonseriesimageurl"];
    }
}



- (IBAction)save:(id)sender
{
    if (_rootController)
    {
        if(_sermonSeries)
        {
            [_sermonSeries setValue:_seriesName.text forKey:@"seriesname"];
            [_sermonSeries setValue:_sermonSeriesImageURL.text forKey:@"sermonseriesimageurl"];
            [_rootController saveContext];
        }
        else
        {
            [_rootController insertSermonSeriesWithName:_seriesName.text sermonseriesimageurl:_sermonSeriesImageURL.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
