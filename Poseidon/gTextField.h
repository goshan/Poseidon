//
//  gTextField.h
//  Poseidon
//
//  Created by goshan on 13-9-4.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gTextField : UIView

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) UITextField *text;




- (id)initWithFrame:(CGRect)frame andMarginLeft:(CGFloat)margin;

- (void) setPlaceholder:(NSString *)content;

- (void) setFont:(UIFont *)font;

- (void) setAlpha:(CGFloat)alpha;

- (void) setTextColor:(UIColor *)color;

- (void) setbackgroundImage:(UIImage *)backgroundImage;

- (void) setPassword;

- (void) setClearButtonShow;

- (void) setTextContent:(NSString *)content;

- (NSString *) getTextContent;


- (void) setDelegate:(id<UITextFieldDelegate>) delegate;

- (void) releaseInput;

@end
