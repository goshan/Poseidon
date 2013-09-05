//
//  LoginViewController.h
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gTextField.h"

@class MainViewController;

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) UIImageView *loginTitle;

@property (retain, nonatomic) UIImageView *usernameImg;

@property (retain, nonatomic) UIImageView *pwImg;

@property (retain, nonatomic) gTextField *usernameInput;

@property (retain, nonatomic) gTextField *pwInput;

@property (retain, nonatomic) UIButton *loginButton;

@property (retain, nonatomic) UIImageView *logoSmall;

@property (retain, nonatomic) UIImageView *logoLarge;

@property (retain, nonatomic) UIImageView *productInfo;

@property (retain, nonatomic) MainViewController *parent;




- (id)initWithParent:(MainViewController *)parent;




@end
