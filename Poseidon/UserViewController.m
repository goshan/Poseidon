//
//  UserViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "UserViewController.h"
#import "Util.h"
#import "UserDetailViewController.h"
#import "UserCreateSourceViewController.h"


@implementation UserViewController

@synthesize tableView = _tableView;
@synthesize bg = _bg;
@synthesize main = _main;
@synthesize content = _content;






- (void)createSource{
    UserCreateSourceViewController *create = [[UserCreateSourceViewController alloc] init];
    [self presentViewController:create animated:YES completion:nil];
    [create release];
}

- (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:userToken];
    
    [_main logoutViewSwitch];
}

- (id)initWithData:(NSArray *)data andMainController:(MainViewController *)main{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:navFullScreenRect];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416-45)];
        self.main = main;
        self.content = data;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"libNav"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"backButtonClick"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
    
    UIButton *rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)] autorelease];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"createButton"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"createButtonClick"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(createSource) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightButton] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setBg:nil];
    [self setMain:nil];
    [self setContent:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_tableView release];
    [_bg release];
    [_main release];
    [_content release];
    [super dealloc];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_content count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:library_cell];
    if (cell == nil) {
        NSArray* objects =  [[NSBundle  mainBundle] loadNibNamed:@"LibraryCell" owner:nil options:nil];
        cell = [objects objectAtIndex:0];
    }
    
    NSDictionary *topic = [_content objectAtIndex:indexPath.row];
    NSDictionary *user = [[_content objectAtIndex:_content.count-1] objectAtIndex:indexPath.row];
    
    UIImageView* cellBg = (UIImageView*)[cell viewWithTag:1];
    UILabel* cellAuthor = (UILabel*)[cell viewWithTag:2];
    UILabel *cellTime = (UILabel*)[cell viewWithTag:3];
    UILabel* cellContent = (UILabel*)[cell viewWithTag:4];
    
    if (indexPath.row == 0){
        [cellBg setImage:[UIImage imageNamed:@"libTableTop"]];
    }
    else if (indexPath.row == _content.count-2){
        [cellBg setImage:[UIImage imageNamed:@"libTableBottom"]];
    }
    else {
        [cellBg setImage:[UIImage imageNamed:@"libTable"]];
    }
    
    cellAuthor.text = [NSString stringWithString:[user objectForKey:libAuthorKey]];
    [cellAuthor setTextColor:[UIColor whiteColor]];
    [cellAuthor setFont:[UIFont systemFontOfSize:13]];
    
    cellTime.text = [Utils genTimeStr:[topic objectForKey:libTimeKey]];
    [cellTime setTextColor:[UIColor whiteColor]];
    [cellTime setFont:[UIFont systemFontOfSize:13]];
    
    NSString *contentShow = [NSString stringWithString:[topic objectForKey:connectionContentKey]];
    cellContent.text = (contentShow.length < contentLength ? contentShow : [[contentShow substringToIndex:contentLength] stringByAppendingString:@"..."]);
    [cellContent setTextColor:[UIColor whiteColor]];
    [cellContent setFont:[UIFont systemFontOfSize:14]];
    cellContent.alpha = 0.7;
    cellContent.lineBreakMode = NSLineBreakByWordWrapping;
    cellContent.numberOfLines = 0;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *topic = [_content objectAtIndex:indexPath.row];
    NSDictionary *user = [[_content objectAtIndex:_content.count-1] objectAtIndex:indexPath.row];
    UserDetailViewController *detail = [[UserDetailViewController alloc] initWithSource:topic andUser:user];
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125.0;
}

@end
