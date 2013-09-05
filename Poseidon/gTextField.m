//
//  gTextField.m
//  Poseidon
//
//  Created by goshan on 13-9-4.
//  Copyright (c) 2013年 goshan. All rights reserved.
//

#import "gTextField.h"

@implementation gTextField



@synthesize bg = _bg;
@synthesize text = _text;


- (id)initWithFrame:(CGRect)frame andMarginLeft:(CGFloat)margin
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        frame.origin.x = 0;
        frame.origin.y = 0;
        _bg = [[UIImageView alloc] initWithFrame:frame];
        
        frame.origin.x += margin;
        frame.size.width -= margin;
        _text = [[UITextField alloc] initWithFrame:frame];
    }
    return self;
}

- (void) setPlaceholder:(NSString *)content{
    [_text setPlaceholder:content];
}

- (void) setFont:(UIFont *)font{
    [_text setFont:font];
}

- (void) setAlpha:(CGFloat)alpha{
    [_text setAlpha:alpha];
}

- (void)setTextColor:(UIColor *)color{
    [_text setTextColor:[UIColor whiteColor]];
}

- (NSString *)gettextContent{
    return _text.text;
}

- (void)setDelegate:(id<UITextFieldDelegate>) delegate{
    _text.delegate = delegate;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [_bg setImage:[UIImage imageNamed:@"loginInput"]];
    [self addSubview:_bg];
    
    [_text setBorderStyle:UITextBorderStyleNone];
    [_text setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_text setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_text];
}


- (void)dealloc {
    [_bg release];
    [_text release];
    [super dealloc];
}


@end
