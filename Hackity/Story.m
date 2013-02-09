//
//  Story.m
//  Hackity
//
//  Created by Jasdeep Narang on 2013-02-07.
//  Copyright (c) 2013 Jasdeep Narang. All rights reserved.
//

#import "Story.h"

@implementation Story

@synthesize title = _title;
@synthesize url = _url;
@synthesize comments_count = _comments_count;

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
    }
    return self;
}

@end
