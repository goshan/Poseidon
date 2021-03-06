//
//  AdminViewController.h
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"



@interface AdminViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) UIButton *connection;

@property (retain, nonatomic) UIButton *library;

@property (retain, nonatomic) NSArray *content;

@property (retain, nonatomic) MainViewController *main;

@property (retain, nonatomic) tipsAlert *tips;




- (id)initWithData:(NSArray *)data andMainController:(MainViewController *)main;

@end
