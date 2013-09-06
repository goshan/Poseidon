//
//  ConnectionViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "ConnectionViewController.h"
#import "Util.h"





@implementation ConnectionViewController


@synthesize bg = _bg;
@synthesize scroll = _scroll;
@synthesize titleBg = _titleBg;
@synthesize titleLabel = _titleLabel;
@synthesize contentBg = _contentBg;
@synthesize content = _content;
@synthesize bottomImage = _bottomImage;
@synthesize topic = _topic;









- (void) edit{
    
}

- (void) back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithTopic:(NSDictionary *)topic
{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:navFullScreenRect];
        _scroll = [[UIScrollView alloc] initWithFrame:navFullScreenRect];
        _titleBg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 300, 32)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+10, 9, 300-20, 32)];
        _contentBg = [[UILabel alloc] initWithFrame:CGRectMake(10, 9+32, 300, connectionDetailsContentHeightMin)];
        _content = [[UILabel alloc] initWithFrame:CGRectMake(10+10, 9+32+10, 300-20, connectionDetailsContentHeightMin-20)];
        _bottomImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9+32+connectionDetailsContentHeightMin, 300, 3)];
        self.topic = topic;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_titleBg setImage:[UIImage imageNamed:@"connectionDetailTitle"]];
    [_scroll addSubview:_titleBg];
    
    [_titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    _titleLabel.text = [_topic objectForKey:connectionTitleKey];
    [_scroll addSubview:_titleLabel];
    
    [_content setFont:[UIFont systemFontOfSize:14]];
    [_content setTextColor:[UIColor whiteColor]];
    _content.alpha = 0.7;
    [_content setBackgroundColor:[UIColor clearColor]];
    _content.text = [_topic objectForKey:connectionContentKey];
    _content.lineBreakMode = NSLineBreakByCharWrapping;
    _content.numberOfLines = 0;
    [_content sizeToFit];
    
    CGRect contentFrame = _content.frame;
    if (contentFrame.size.height > connectionDetailsContentHeightMin-20){
        CGRect contentBgFrame = _contentBg.frame;
        contentBgFrame.size.height = contentFrame.size.height+20;
        [_contentBg setFrame:contentBgFrame];
    }
    [_contentBg setBackgroundColor:colorWithRGBA(46, 23, 48, 30)];
    [_scroll addSubview:_contentBg];
    
    [_scroll addSubview:_content];
    
    CGRect contentBgFrame = _contentBg.frame;
    CGRect bottomFrame = _bottomImage.frame;
    bottomFrame.origin.y = contentBgFrame.origin.y + contentBgFrame.size.height;
    [_bottomImage setFrame:bottomFrame];
    [_bottomImage setImage:[UIImage imageNamed:@"connectionDetailBottom"]];
    [_scroll addSubview:_bottomImage];
    
    _scroll.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    _scroll.clipsToBounds = YES;
    _scroll.scrollEnabled = YES;
    [_scroll setContentSize:CGSizeMake(320, 9+32+contentBgFrame.size.height+3)];
    [_scroll setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_scroll];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"detailNavi"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButtonClick"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
    
    UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"editButton"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"editButtonClick"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightButton] autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setBg:nil];
    [self setScroll:nil];
    [self setTitleBg:nil];
    [self setTitleLabel:nil];
    [self setContentBg:nil];
    [self setContent:nil];
    [self setBottomImage:nil];
    [self setTopic:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_bg release];
    [_scroll release];
    [_titleBg release];
    [_titleLabel release];
    [_contentBg release];
    [_content release];
    [_bottomImage release];
    [_topic release];
    [super dealloc];
}

@end
