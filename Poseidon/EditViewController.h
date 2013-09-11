//
//  EditViewController.h
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gTextField.h"
#import "gTextArea.h"
#import "tipsAlert.h"

@interface EditViewController : UIViewController

@property (retain, nonatomic) UINavigationBar *navBar;
@property (retain, nonatomic) UINavigationItem *navItem;
@property (retain, nonatomic) UIBarButtonItem *send;
@property (retain, nonatomic) UIBarButtonItem *cancel;
@property (retain, nonatomic) UIImageView *bg;
@property (retain, nonatomic) gTextField *titleInput;
@property (retain, nonatomic) gTextArea *contentInput;
@property (retain, nonatomic) tipsAlert *tips;



- (id) initWithTtitle:(NSString *)title andContent:(NSString *)content;


@end
