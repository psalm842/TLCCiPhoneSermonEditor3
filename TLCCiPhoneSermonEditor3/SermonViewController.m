//
//  SermonViewController.m
//  LeagueManager
//
//  Created by Jessi on 7/16/13.
//  Copyright (c) 2013 ProCoreData. All rights reserved.
//

#import "SermonViewController.h"
#import "SermonSeriesTableViewController.h"

@interface SermonViewController ()

@end

@implementation SermonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (_sermon)
    {
        _sermonTitle.text = [_sermon valueForKey:@"sermontitle"];
        _description.text = [_sermon valueForKey:@"sermondescription"];
        _videourl.text = [_sermon valueForKey:@"videourl"];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initWithRootController:(SermonSeriesTableViewController *)aRootController sermonSeries:(NSManagedObject *)sermonSeries sermon:(NSManagedObject *)sermon
{
    _rootController = aRootController;
    _sermonSeries = sermonSeries;
    _sermon = sermon;
}



#pragma mark - Instance Methods
- (IBAction)save:(id)sender
{
    if (_rootController)
    {
        if (_sermon)
        {
            [_sermon setValue:_sermonTitle.text forKey:@"sermontitle"];
            [_sermon setValue:_description.text forKey:@"sermondescription"];
            [_sermon setValue:_videourl.text forKey:@"videourl"];
            [_rootController saveContext];
        } else
        {
            [_rootController insertSermonWithSermonSeries:_sermonSeries title:_sermonTitle.text description:_description.text videourl:_videourl.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)confirmDelete:(id)sender
{
    if (_sermon)
    {
        UIActionSheet *confirm = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete sermon" otherButtonTitles:nil];
        
        confirm.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [confirm showInView:self.view];
    }
}



#pragma mark - Action Sheet Delegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 && _rootController) {
        [_rootController deletesermon:_sermon];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
