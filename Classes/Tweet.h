//
//  Tweet.h
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Tweet : NSObject {

	NSString *text; // text of the tweet
}

@property (nonatomic, retain) NSString *text;

@end
