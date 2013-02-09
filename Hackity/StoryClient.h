//
//  Story.h
//  Hackity
//
//  Created by Jasdeep Narang on 2013-02-06.
//  Copyright (c) 2013 Jasdeep Narang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface StoryClient : AFHTTPClient

+ (id)sharedInstance;

@end
