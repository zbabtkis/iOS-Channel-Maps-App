//
//  NEESDetailViewController.h
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEESDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UIImageView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
