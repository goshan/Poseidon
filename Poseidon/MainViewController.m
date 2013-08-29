//
//  Main2ViewController.m
//  Poseidon
//
//  Created by goshan on 13-8-29.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "MainViewController.h"
#import "Util.h"
#import "gAnimation.h"





@implementation MainViewController

BOOL isBlink = YES;


@synthesize button = _button;
@synthesize blinkTimer = _blinkTimer;





- (void) starBlink{
    [gAnimation makeView:_button blinkWithDuration:mainPageBlinkCycle];
}

- (void)makeViewBlink{
    if (isBlink){
        [self starBlink];
        _blinkTimer = [NSTimer scheduledTimerWithTimeInterval:mainPageBlinkCycle target:self selector:@selector(starBlink) userInfo:nil repeats:YES];
        isBlink = YES;
    }
    else if (isBlink){
        [_blinkTimer invalidate];
        isBlink = NO;
    }
}

- (void) showStatusBar{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (IBAction)arrowClick:(id)sender {
    [gAnimation moveView:self.view toFinalFrame:CGRectMake(0, -500, 320, 460) withDuration:mainPageHiddenTime];
    [self performSelector:@selector(showStatusBar)withObject:nil afterDelay:mainPageHiddenTime];
    [self removeFromParentViewController];
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeViewBlink];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_button release];
    [super dealloc];
}

@end
