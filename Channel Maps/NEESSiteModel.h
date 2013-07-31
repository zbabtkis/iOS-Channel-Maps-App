//
//  NEESSiteModel.h
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEESSiteModel : NSObject

@property NSString *site_id;
@property NSString *isActive;
@property NSString *mapBE;
@property NSString *mapCS;
@property NSURL    *url;
@property NSURL    *baseURL;

-(id)initWithSite:(NSDictionary *)site;
-(NSArray *)fetchChannels;

@end
