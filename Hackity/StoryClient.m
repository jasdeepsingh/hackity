//
//  Story.m
//  Hackity
//
//  Created by Jasdeep Narang on 2013-02-06.
//  Copyright (c) 2013 Jasdeep Narang. All rights reserved.
//

#import "StoryClient.h"
#import "AFNetworking.h"

#define HNAPIBaseURLString @"-link-to-node-app-here-"

@implementation StoryClient

+ (id)sharedInstance {
    static StoryClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[StoryClient alloc] initWithBaseURL:
                            [NSURL URLWithString:HNAPIBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.parameterEncoding = AFJSONParameterEncoding;
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

@end
