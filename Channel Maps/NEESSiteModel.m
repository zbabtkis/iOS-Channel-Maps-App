//
//  NEESSiteModel.m
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import "NEESSiteModel.h"

@implementation NEESSiteModel

-(id)init {
    self = [super init];
    
    _url = @"http://www.nees.ucsb.edu/";
    
    return self;
}
-(id)initWithSite:(NSDictionary *)site {

    _isActive = [site objectForKey:@"enabled"];
    _site_id  = [site objectForKey:@"id"];
    _mapBE    = [[[[site objectForKey:@"images"] objectForKey:@"birdsEye"] objectForKey:@"full"] objectForKey:@"src"];
    _mapCS    = [[[[site objectForKey:@"images"] objectForKey:@"crossSection"] objectForKey:@"full"] objectForKey:@"src"];
    
    return [self init];
}
@end
