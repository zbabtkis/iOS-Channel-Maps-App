//
//  NEESSitesModel.h
//  Channel Maps
//
//  Created by zack on 7/30/13.
//  Copyright (c) 2013 NEES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEESSitesModel : NSObject

@property NSMutableArray *models;

-(id)init;
+(NSMutableArray *)fetch;
@end
