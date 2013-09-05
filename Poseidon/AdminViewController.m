//
//  AdminViewController.m
//  Poseidon
//
//  Created by goshan on 13-9-5.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "AdminViewController.h"
#import "Util.h"




@implementation AdminViewController

@synthesize tableView = _tableView;
@synthesize bg = _bg;
@synthesize main = _main;
@synthesize content = _content;





- (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:user_token];
    
    [_main logoutViewSwitch:self.navigationController];
}


- (id)initWithData:(NSArray *)data andMainController:(MainViewController *)main{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
        self.main = main;
        self.content = data;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"connectionNav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)] autorelease];
    [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageNamed:@"backButtonClick"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
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
    return [_content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:connection_cell];
    if (cell == nil) {
        NSArray* objects =  [[NSBundle  mainBundle] loadNibNamed:@"ConnectionCell" owner:nil options:nil];
        cell = [objects objectAtIndex:0];
    }
    
    NSDictionary *topic = [_content objectAtIndex:indexPath.row];
    
    // Set up the cell...
    UIImageView* cellBg = (UIImageView*)[cell viewWithTag:1];
    UILabel* cellTitle = (UILabel*)[cell viewWithTag:2];
    UILabel* cellContent = (UILabel*)[cell viewWithTag:3];
    
    if (indexPath.row == 0){
        [cellBg setImage:[UIImage imageNamed:@"connectionTableTop"]];
    }
    else if (indexPath.row == _content.count-1){
        [cellBg setImage:[UIImage imageNamed:@"connectionTableBottom"]];
    }
    else {
        [cellBg setImage:[UIImage imageNamed:@"connectionTable"]];
    }
    
    cellTitle.text = [NSString stringWithString:[topic objectForKey:@"title"]];
    [cellTitle setTextColor:[UIColor whiteColor]];
    [cellTitle setFont:[UIFont systemFontOfSize:13]];
    
    NSString *contentShow = [NSString stringWithString:[topic objectForKey:@"content"]];
    cellContent.text = (contentShow.length < connectionContentLength ? contentShow : [[contentShow substringToIndex:connectionContentLength] stringByAppendingString:@"..."]);
    [cellContent setTextColor:[UIColor whiteColor]];
    [cellContent setFont:[UIFont systemFontOfSize:14]];
    cellContent.lineBreakMode = NSLineBreakByWordWrapping;
    cellContent.numberOfLines = 0;
    [cellContent sizeToFit];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_parent showSpinner];
    NSDictionary *book = [_bookIndex bookInfoAtIndex:indexPath.row];
    if(_parent.bookView && [_parent.bookView.book objectForKey:BOOKID] == [book objectForKey:BOOKID]){
        [_parent showBookViewController];
    }
    else {
        [_parent performSelector:@selector(showBookViewControllerByInitWith:) withObject:book afterDelay:0.0];
    }
    
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125.0;
}

@end
