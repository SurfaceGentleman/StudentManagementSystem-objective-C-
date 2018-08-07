//
//  LoginViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<ReturnTextDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //添加管理
    _management = [Management new];
    _newsAccount = [Account new];
    
    //输入框
    _textFieldUserName = [[UITextField alloc] initWithFrame:CGRectMake(40, 300, 340, 40)];
    _textFieldUserName.backgroundColor = [UIColor whiteColor];

    _textFieldPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 350, 340, 40)];
    _textFieldPassword.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_textFieldUserName];
    [self.view addSubview:_textFieldPassword];
    
    //添加左右图片
    UIImageView * imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    imageViewUserName.frame = CGRectMake(0, 0, 40, 40);
    _textFieldUserName.leftView = imageViewUserName;
    _textFieldUserName.leftViewMode = UITextFieldViewModeAlways;
    _textFieldUserName.placeholder = @"请输入用户名";
    
    UIImageView * imageViewPassword = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    imageViewPassword.frame = CGRectMake(0, 0, 40, 40);
    _textFieldPassword.leftView = imageViewPassword;
    _textFieldPassword.leftViewMode = UITextFieldViewModeAlways;
    _textFieldPassword.placeholder = @"请输入密码";
    
    //按钮
    _buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLogin.frame = CGRectMake(100, 440, 80, 30);
    [_buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonLogin.titleLabel.font = [UIFont systemFontOfSize:18];
    [_buttonLogin addTarget:self action:@selector(clickToMain) forControlEvents:UIControlEventTouchUpInside];
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
    
    [_buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
    [_buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonRegister.titleLabel.font = [UIFont systemFontOfSize:18];
    [_buttonRegister addTarget:self action:@selector(clickToRegister) forControlEvents:UIControlEventTouchUpInside];
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
    labelName.frame = CGRectMake(100, 110, 300, 120);
    labelName.text = @"学生管理系统";
    labelName.textColor = [UIColor whiteColor];
    labelName.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:labelName];
    
    UILabel * labelAuthor = [UILabel new];
    labelAuthor.text = @"By : SurfaceGentleman";
    labelAuthor.font = [UIFont systemFontOfSize:18];
    labelAuthor.textColor = [UIColor colorWithRed:0.92 green:1.00 blue:0.22 alpha:1.00];
    labelAuthor.frame = CGRectMake(220, 650, 200, 30);
    [self.view addSubview:labelAuthor];
    
}

- (void)clickToRegister
{
    RegisterViewController * registerViewController = [RegisterViewController new];
    registerViewController.delegate = self;
    [self presentViewController:registerViewController animated:YES completion:nil];
}

- (void)getTextFieldPassword:(NSString *)textPassword
{
    self.textFieldPassword.text = textPassword;
    _newsAccount.passwordStr = textPassword;
}

- (void)getTextFieldUserName:(NSString *)textUserName
{
    self.textFieldUserName.text = textUserName;
    _newsAccount.userNameStr = textUserName;
}

- (void)clickToMain
{
    [_management addAccount:_newsAccount];
    for(Account * account in _management.accoutMutableArray) {
        if (YES == [_textFieldUserName.text isEqualToString:account.userNameStr]) {
            if (YES == [_textFieldPassword.text isEqualToString:account.passwordStr]) {
                MainViewController * mainViewController = [MainViewController new];
                [self presentViewController:mainViewController animated:YES completion:nil];
                return;
            }
            else {
                UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction: defaultAction];
                [self presentViewController: alert animated: YES completion:nil];
                return;
            }
        }
    }
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction: defaultAction];
    [self presentViewController: alert animated: YES completion:nil];
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
