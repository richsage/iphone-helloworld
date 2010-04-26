//
//  XMLParser.h
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class hello_worldAppDelegate, Tweet;

@interface XMLParser : NSObject {
	
	NSMutableString *currentElementValue;
	
	hello_worldAppDelegate *appDelegate;
	Tweet *aTweet;

}

- (XMLParser *) initXMLParser;

@end
