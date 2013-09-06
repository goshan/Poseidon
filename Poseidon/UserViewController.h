//
//  UserViewController.h
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface UserViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) NSArray *content;

@property (retain, nonatomic) MainViewController *main;




- (id)initWithData:(NSArray *)data andMainController:(MainViewController *)main;


@end
