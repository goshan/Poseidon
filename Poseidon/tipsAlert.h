//
//  tipsAlert.h
//  easyFollow
//
//  Created by Qiu Han on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "Toast+UIView.h"

@interface tipsAlert : NSObject


@property (retain, nonatomic) UIView *view;
@property (retain, nonatomic) MBProgressHUD *loadingSpinner;



- (tipsAlert *)initWith:(UIView *)view;
- (void)showErrorAlertWithTitle:(NSString *)title andMessage:(NSString *)msg andButtonTitle:(NSString *)button;
- (void)showLoadingWithContent:(NSString *)msg;
- (void)hiddenLoading;
- (void)showTipsWithTitle:(NSString *)title andMessage:(NSString *)msg;




@end
