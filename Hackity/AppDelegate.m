//
//  AppDelegate.m
//  Hackity
//
//  Created by Jasdeep Narang on 2013-02-06.
//  Copyright (c) 2013 Jasdeep Narang. All rights reserved.
//

#import "AppDelegate.h"
#import "INAppStoreWindow.h"
#import "StoryClient.h"

@implementation AppDelegate
@synthesize storiesTable = _storiesTable;
@synthesize stories = _stories;

#pragma mark - NSTableViewDataSource Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)storiesTable {
    return [self.stories count];
}

- (id)tableView:(NSTableView *)storiesTable objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    return [[self.stories objectAtIndex:row] objectForKey:@"title"];
}

- (NSView *)tableView:(NSTableView *)storiesTable viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cell = [storiesTable makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSDictionary *story = [self.stories objectAtIndex:row];
    cell.textField.stringValue = [story objectForKey:@"title"];
    cell.imageView.image = Nil;
    cell.layer.borderColor = CGColorGetConstantColor(kCGColorBlack);
    [self.storiesTable setRowHeight:50];
    return cell;
}

#pragma mark - Application Lifecycle

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
    [self loadStories];
    [self.window setTitle:@"Hackity App"];
    self.window.showsTitle = YES;
    self.window.titleBarHeight = 60.0;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

}

- (void)loadStories {
    [[StoryClient sharedInstance] getPath:@"new" parameters:nil
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      self.stories = responseObject;
                                      [self.storiesTable reloadData];
                                      NSLog(@"Response: %@", self.stories);
                                  }
                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                      NSLog(@"Error: %@", error);
                                  }];
}


@end
