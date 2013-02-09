//
//  AppDelegate.h
//  Hackity
//
//  Created by Jasdeep Narang on 2013-02-06.
//  Copyright (c) 2013 Jasdeep Narang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "INAppStoreWindow.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet INAppStoreWindow *window;
@property (retain, nonatomic) IBOutlet NSTableView *storiesTable;
@property (nonatomic, retain) NSArray *stories;

@end
