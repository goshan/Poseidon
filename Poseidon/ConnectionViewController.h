//
//  ConnectionViewController.h
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectionViewController : UIViewController

@property (retain, nonatomic) UIImageView *bg;
@property (retain, nonatomic) UIScrollView *scroll;
@property (retain, nonatomic) UIImageView *titleBg;
@property (retain, nonatomic) UILabel *titleLabel;
@property (retain, nonatomic) UILabel *contentBg;
@property (retain, nonatomic) UILabel *content;
@property (retain, nonatomic) UIImageView *bottomImage;
@property (retain, nonatomic) NSDictionary *topic;



- (id)initWithTopic:(NSDictionary *)topic;

@end
