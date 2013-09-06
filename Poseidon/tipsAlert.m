//
//  tipsAlert.m
//  easyFollow
//
//  Created by Qiu Han on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tipsAlert.h"

@implementation tipsAlert

@synthesize view = _view;
@synthesize loadingSpinner = _loadingSpinner;



- (void)showErrorAlertWithTitle:(NSString *)title andMessage:(NSString *)msg andButtonTitle:(NSString *)button{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:button otherButtonTitles:nil] autorelease];
    [alert show];
}


- (void)showLoadingWithContent:(NSString *)msg{
    _loadingSpinner.labelText = msg;
    [_view addSubview:_loadingSpinner];
    [_loadingSpinner show:YES];
}

- (void)hiddenLoading{
    [_loadingSpinner hide:YES];
    [_loadingSpinner removeFromSuperview];
}

- (void)showTipsWithTitle:(NSString *)title andMessage:(NSString *)msg{
    [_view makeToast:msg duration:3.0 position:@"center" title:title];
}

- (tipsAlert *)initWith:(UIView *)view{
    self = [super init];
    if (self){
        self.view = view;
        _loadingSpinner = [[MBProgressHUD alloc] initWithView:_view];
    }
    return self;
}

- (void)dealloc {
    [_view release];
    [_loadingSpinner release];
    [super dealloc];
}

@end
