//
//  RegisterViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _management = [Management new];
    //_management.accoutMutableArray = [NSMutableArray new];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:1.00 blue:0.00 alpha:1.00];
    //输入框
    _textFieldUserName = [[UITextField alloc] initWithFrame:CGRectMake(40, 300, 340, 40)];
    _textFieldUserName.backgroundColor = [UIColor whiteColor];
    
    _textFieldPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 350, 340, 40)];
    _textFieldPassword.backgroundColor = [UIColor whiteColor];
    _textFieldPassword.secureTextEntry = YES;
    
    [self.view addSubview:_textFieldUserName];
    [self.view addSubview:_textFieldPassword];
    
    //添加左图片
    UIImageView * imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    imageViewUserName.frame = CGRectMake(0, 0, 40, 40);
    _textFieldUserName.leftView = imageViewUserName;
    _textFieldUserName.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView * imageViewPassword = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    imageViewPassword.frame = CGRectMake(0, 0, 40, 40);
    _textFieldPassword.leftView = imageViewPassword;
    _textFieldPassword.leftViewMode = UITextFieldViewModeAlways;
    
    //按钮
    _buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLogin.frame = CGRectMake(100, 440, 80, 30);
    [_buttonLogin setTitle:@"返回" forState:UIControlStateNormal];
    [_buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonLogin.titleLabel.font = [UIFont systemFontOfSize:18];
    [_buttonLogin addTarget:self action:@selector(clickToLogin) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [_buttonLogin.layer setMasksToBounds:YES];
    //半径
    [_buttonLogin.layer setCornerRadius:15];
    //宽度
    [_buttonLogin.layer setBorderWidth:1];
    //边框颜色
    [_buttonLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:_buttonLogin];
    
    _buttonRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonRegister.frame = CGRectMake(200, 440, 80, 30);
    
    [_buttonRegister setTitle:@"点击注册" forState:UIControlStateNormal];
    [_buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonRegister.titleLabel.font = [UIFont systemFontOfSize:18];
    [_buttonRegister addTarget:self action:@selector(showRegister) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [_buttonRegister.layer setMasksToBounds:YES];
    //半径
    [_buttonRegister.layer setCornerRadius:15];
    //宽度
    [_buttonRegister.layer setBorderWidth:1];
    //边框颜色
    [_buttonRegister.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:_buttonRegister];
    
    //添加Label
    UILabel * labelName = [UILabel new];
    labelName.frame = CGRectMake(140, 110, 300, 120);
    labelName.text = @"注册🙋‍♂️";
    labelName.textColor = [UIColor whiteColor];
    labelName.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:labelName];
    
    UILabel * labelAuthor = [UILabel new];
    labelAuthor.text = @"By : SurfaceGentleman";
    labelAuthor.font = [UIFont systemFontOfSize:18];
    labelAuthor.textColor = [UIColor colorWithRed:0.69 green:0.96 blue:0.40 alpha:1.00];
    labelAuthor.frame = CGRectMake(220, 650, 200, 30);
    [self.view addSubview:labelAuthor];
    
}

- (void)showRegister
{
    Account * newAccount = [Account new];
    newAccount.userNameStr = _textFieldUserName.text;
    newAccount.passwordStr = _textFieldPassword.text;
    if (NO == [_management isAccountInData:_textFieldUserName.text]) {
        [_management addAccount:newAccount];
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"注册已成功" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: defaultAction];
        [self presentViewController: alert animated: YES completion:nil];
    }
    else{
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账户已存在" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: defaultAction];
        [self presentViewController: alert animated: YES completion:nil];
    }
    NSLog(@"%@", _management.accoutMutableArray);
}

- (void)clickToLogin
{
    [self.delegate getTextFieldUserName:_textFieldUserName.text];
    [self.delegate getTextFieldPassword:_textFieldPassword.text];
    
    [self.delegate2 getAccountArray:_management.accoutMutableArray];
    //back
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
