//
//  gTextArea.h
//  Poseidon
//
//  Created by goshan on 13-9-6.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gTextArea : UIView

@property (retain, nonatomic) UIImageView *bg;

@property (retain, nonatomic) UITextView *text;




- (id)initWithFrame:(CGRect)frame andMarginLeft:(CGFloat)margin;

- (void) setFont:(UIFont *)font;

- (void) setAlpha:(CGFloat)alpha;

- (void) setTextColor:(UIColor *)color;

- (void) setbackgroundImage:(UIImage *)backgroundImage;

- (void) setTextContent:(NSString *)content;

- (NSString *) getTextContent;

- (void) setDelegate:(id<UITextViewDelegate>) delegate;


@end
