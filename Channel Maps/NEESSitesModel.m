//
//  NEESSitesModel.m
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import "NEESSitesModel.h"
#import "NEESSiteModel.h"

@implementation NEESSitesModel

+(NSMutableArray *)fetch {
    NSURL *url = [NSURL URLWithString:@"http://www.nees.ucsb.edu/channel-maps/ajax/sites"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableArray *parsedArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return parsedArray;
}
-(id)init {
    self = [super init];
    
    NSMutableArray *sitesArray = [NEESSitesModel fetch];
    NSMutableArray *modelsArray = [[NSMutableArray alloc] init];
    
    for(id obj in sitesArray) {
        NEESSiteModel *model = [[NEESSiteModel alloc] initWithSite:obj];
        
        if([model.isActive boolValue]) {
            [modelsArray addObject:model];
        }
    }
    
    _models = [[NSMutableArray alloc] initWithArray:modelsArray];
        
    return self;
}

@end
