//
//  CSSHomeView.m
//  YYZN
//
//  Created by CCPG_iOS on 2017/2/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "CSSHomeView.h"

@interface CSSHomeView()
{
    NSDictionary *loginDic;
}

@property (strong,nonatomic) UIButton    *loginButton;

@property (strong,nonatomic) UITextField *memberCodeTextField;

@property (strong,nonatomic) UITextField *nameLabTextField;

@property (strong,nonatomic) UITextField *passwordLabTextField;

@end



@implementation CSSHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self setSubViews];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    
    _memberCodeTextField = (UITextField *)self.instanceInit(TypeTextField);
    _memberCodeTextField.placeholder = @"请输入组织机构";
    _memberCodeTextField.delegate = self;
    _memberCodeTextField.text = @"ccpg";
    _memberCodeTextField.font = [UIFont systemFontOfSize:14];
    
    _nameLabTextField = (UITextField *)self.instanceInit(TypeTextField);
    _nameLabTextField.placeholder = @"请输入账号";
    _nameLabTextField.delegate = self;
    _nameLabTextField.text = @"maoyangqing";
    _nameLabTextField.font = [UIFont systemFontOfSize:14];
    
    _passwordLabTextField = (UITextField *)self.instanceInit(TypeTextField);
    _passwordLabTextField.placeholder = @"请输入密码";
    _passwordLabTextField.delegate = self;
    _passwordLabTextField.text = @"123456";
    _passwordLabTextField.font = [UIFont systemFontOfSize:14];
    
    _loginButton = (UIButton *)self.instanceInit(TypeButton);
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor redColor]];
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self addSubview:_memberCodeTextField];
    [self addSubview:_nameLabTextField];
    [self addSubview:_passwordLabTextField];
    [self addSubview:_loginButton];
}


- (void)setSubViews{
    [_memberCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW / 2, 44));
    }];
    
    [_nameLabTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_memberCodeTextField).offset(30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW / 2, 44));
    }];
    
    [_passwordLabTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabTextField).offset(30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW / 2, 44));
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordLabTextField).offset(30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(EW_ScreenW / 2, 44));
    }];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    loginDic  =   @{
                                  @"memberCode":_memberCodeTextField.text,
                                  @"name":_nameLabTextField.text,
                                  @"password":_passwordLabTextField.text
                                  };
    return YES;
}

- (void)loginButtonClick{
    self.name = _nameLabTextField.text;
    self.memerCode = _memberCodeTextField.text;
    self.password = _passwordLabTextField.text;
    loginDic  =   @{
                    @"memberCode":self.memerCode,
                    @"name":self.name,
                    @"password":self.password
                    };
    
    if ([self.delegate respondsToSelector:@selector(doLoginBy:)]) {
        [self.delegate doLoginBy:loginDic];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
