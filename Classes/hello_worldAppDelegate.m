//
//  hello_worldAppDelegate.m
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "hello_worldAppDelegate.h"
#import "HelloWorldViewController.h"
#import "XMLParser.h"
#import "Tweet.h"


@implementation hello_worldAppDelegate

@synthesize window;
@synthesize helloWorldViewController;
@synthesize tweets;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {  

	self.tweets = [[NSMutableArray alloc] init];
	
	// Create a new view controller for use in our app
	HelloWorldViewController *aViewController = [[HelloWorldViewController alloc]
												 initWithNibName:@"HelloWorldViewController" bundle:[NSBundle mainBundle]];
	
	// Tell the app delegate which view controller to use
	[self setHelloWorldViewController:aViewController];
	
	// Release the one we created; there is a copy of it now...
	[aViewController release];
	
	// Set which view to use before we show it
	UIView *controllersView = [helloWorldViewController view];
	[window addSubview:controllersView];
    
	// and now show it all
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[helloWorldViewController release];
    [window release];
    [super dealloc];
}


@end
