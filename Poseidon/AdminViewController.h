//
//  AdminViewController.h
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) NSArray *data;




- (id)initWithData:(NSArray *)data;

@end
