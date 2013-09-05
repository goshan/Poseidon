//
//  Main2ViewController.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "AdminViewController.h"

@interface MainViewController : UIViewController

@property (retain, nonatomic) UIImageView *cover;

@property (retain, nonatomic) UIButton *button;

@property(retain, nonatomic) NSTimer *blinkTimer;

@property (retain, nonatomic) LoginViewController *login;




- (void)loginViewSwitch:(NSString *)user_type;

- (void)logoutViewSwitch:(UINavigationController *)nav;

@end
