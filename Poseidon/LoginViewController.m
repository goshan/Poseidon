//
//  LoginViewController.m
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg2"] forBarMetrics:UIBarMetricsDefault];
        self.title = @"Login";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
        //[self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageNamed:@"navigation_item_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
