//
//  HelloWorldViewController.m
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "hello_worldAppDelegate.h"
#import "HelloWorldViewController.h"
#import "Tweet.h"
#import "XMLParser.h"


@implementation HelloWorldViewController

@synthesize username;
@synthesize tweetList;
@synthesize usernameStr;

- (IBAction)changeUsername:(id)sender {
	
	[username resignFirstResponder];
	
	// get username from field
	self.usernameStr = username.text;
	
	// XXX check for the length
	
	NSString *baseUrl;
	baseUrl = @"http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=";
	
	NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, usernameStr];
	
	// Get XML in
	NSURL *url = [[NSURL alloc] initWithString:urlStr];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	
	// initialise delegate
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	
	// Start parsing
	BOOL success = [xmlParser parse];
	
	hello_worldAppDelegate *appDelegate = (hello_worldAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (success)
	{
		[tweetList reloadData];
		tweetList.hidden = false;
	}
	else {
		tweetList.hidden = true;
	}
	
	[url release];
	[baseUrl release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

	if (textField == username) {
		[textField resignFirstResponder];
	}
		
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	// Hide the tweet list by default
	tweetList.hidden = TRUE;
	
	self.title = @"Rich's app";
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    hello_worldAppDelegate *appDelegate = (hello_worldAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return appDelegate.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	hello_worldAppDelegate *appDelegate = (hello_worldAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"got app delegate");
	
	Tweet *thisRow = [[appDelegate tweets] objectAtIndex:[indexPath row]];
	NSString *contentForThisRow = thisRow.text;
	NSLog(@"got contentForThisRow");
	
	static NSString *CellIdentifier = @"CellIdentifier";
	

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	NSLog(@"Got cell");
	
	[[cell textLabel] setText:contentForThisRow];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
	[username release];
	[tweetList release];
	[usernameStr release];
    [super dealloc];
}


@end
