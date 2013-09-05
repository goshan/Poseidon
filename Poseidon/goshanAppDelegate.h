//
//  AppDelegate.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "LoginViewController.h"

@interface goshanAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) MainViewController *main;

@end
