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
@synthesize data = _data;

- (id)initWithData:(NSArray *)data{
    self = [super init];
    if (self) {
        // Custom initialization
        _bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
        _data = data;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg1"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(showRegistPage)] autorelease];
    [self.navigationItem.rightBarButtonItem setBackgroundImage:[UIImage imageNamed:@"navigation_item_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_bg setImage:[UIImage imageNamed:@"backgroundSmall"]];
    [self.view addSubview:_bg];
    
    _tableView.delegate = self;
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
    [self setData:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_tableView release];
    [_bg release];
    [_data release];
    [super dealloc];
}


/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"indexCell_id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray* objects =  [[NSBundle  mainBundle] loadNibNamed:@"indexCell" owner:nil options:nil];
        cell = [objects objectAtIndex:0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *book = [_bookIndex bookInfoAtIndex:indexPath.row];
    
    // Set up the cell...
    UIImageView* bookImage = (UIImageView*)[cell viewWithTag:1];
    UILabel* bookName = (UILabel*)[cell viewWithTag:2];
    
    [bookImage setImage:[UIImage imageNamed:[book objectForKey:IMAGEFILE]]];
    bookName.text = [NSString stringWithString:[book objectForKey:BOOKNAME]];
    
    //make image round
    CALayer *layer = bookImage.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 5.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}
*/
@end
