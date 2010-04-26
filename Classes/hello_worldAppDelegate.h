//
//  hello_worldAppDelegate.h
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface hello_worldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	HelloWorldViewController *helloWorldViewController;
	
	NSMutableArray *tweets;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloWorldViewController *helloWorldViewController;
@property (nonatomic, retain) NSMutableArray *tweets;

@end

