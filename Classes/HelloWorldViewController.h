//
//  HelloWorldViewController.h
//  hello-world
//
//  Created by Rich Sage on 25/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelloWorldViewController : UIViewController < UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate > {

	UITextField *username;
	UIButton *goButton;
	UITableView *tweetList;
	
	NSString *usernameStr;
}

@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITableView *tweetList;
@property (nonatomic, copy) NSString *usernameStr;

- (IBAction)changeUsername:(id)sender;

@end
