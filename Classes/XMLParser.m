//
//  XMLParser.m
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "hello_worldAppDelegate.h"
#import "XMLParser.h"
#import "Tweet.h"

@implementation XMLParser

- (XMLParser *) initXMLParser {

	[super init];
	
	appDelegate = (hello_worldAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"statuses"]) {
		//Initialize the array.
		appDelegate.tweets = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"status"]) {
		
		//Initialize the book.
		aTweet = [[Tweet alloc] init];
		
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"statuses"])
		return;
	
	if([elementName isEqualToString:@"status"]) {
		NSLog([[NSString alloc] initWithFormat:@"current count %d", appDelegate.tweets.count]);
		[appDelegate.tweets addObject:aTweet];
		
		[aTweet release];
		aTweet = nil;
	}
	else if ([elementName isEqualToString:@"text"]) {
		
		[aTweet setValue:currentElementValue forKey:elementName];
	
	}	
		
	[currentElementValue release];
	currentElementValue = nil;
}

- (void) dealloc {
	
	[aTweet release];
	[currentElementValue release];
	[super dealloc];
}

@end
