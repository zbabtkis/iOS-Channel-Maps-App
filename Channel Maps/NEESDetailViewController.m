//
//  NEESDetailViewController.m
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import "NEESDetailViewController.h"
#import "NEESSiteModel.h"

@interface NEESDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation NEESDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSURL *imagePath = [[self.detailItem baseURL] URLByAppendingPathComponent:[self.detailItem mapBE]];
        NSData *imageData = [NSData dataWithContentsOfURL:imagePath];
        UIImage *map = [[UIImage alloc] initWithData:imageData];
        
        [self.mapView initWithImage:map];
        
        NSArray *channels = [self.detailItem fetchChannels];
        
        for(id obj in channels) {
            float xoff = [[[[obj objectForKey:@"offset"] objectForKey:@"birdsEye"] objectForKey:@"x"] integerValue] / 3;
            float yoff = [[[[obj objectForKey:@"offset"] objectForKey:@"birdsEye"] objectForKey:@"y"] integerValue] / 2.8;
            UIButton *chanBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            chanBtn.frame = CGRectMake(xoff,yoff, 15, 15);
#if DEBUG
            NSLog(@"x offset: %i, y offset: %i", xoff, yoff);
#endif
            [chanBtn setTitle:[NSString stringWithFormat:@"%@", [obj objectForKey:@"id"]] forState:UIControlStateNormal];
            [self.view addSubview:chanBtn];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
