//
//  _aAppDelegate.m
//  1a
//
//  Created by Bill Abel on 4/11/09.
//  Copyright Studio Pragmatica 2009. All rights reserved.
//

#import "_aAppDelegate.h"

@implementation _aAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
