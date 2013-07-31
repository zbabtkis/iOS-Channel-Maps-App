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

-(NSMutableArray *)fetch {
    NSURLRequest *request = [NSURLRequest requestWithURL:[self url]];
    
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableArray *parsedArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return parsedArray;
}
-(id)init {
    self = [super init];
    
    if(!_url) {
        _url = [NSURL URLWithString:@"http://www.nees.ucsb.edu/channel-maps/ajax/sites"];
    }
    
    
    
    NSMutableArray *sitesArray  = [self fetch];
    NSMutableArray *modelsArray = [[NSMutableArray alloc] init];
    
    for(id obj in sitesArray) {
        NEESSiteModel *model = [[NEESSiteModel alloc] initWithSite:obj];
        
        model.url     = _url;
        model.baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",[_url host]]];
        
        if([model.isActive boolValue]) {
            [modelsArray addObject:model];
        }
    }
    
    _models = [[NSMutableArray alloc] initWithArray:modelsArray];
        
    return self;
}

-(id)initWithURL:(NSURL *)url {
    _url = url;
    
    return self = [self init];
}

@end
