//
//  NEESMasterViewController.h
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NEESDetailViewController;

@interface NEESMasterViewController : UITableViewController

@property (strong, nonatomic) NEESDetailViewController *detailViewController;

-(void)populateWithSites:sites;

@end
