//
//  LoginViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"
#import "MainViewController.h"

@interface LoginViewController : UIViewController



@property(nonatomic, strong)UITextField * textFieldUserName;
@property(nonatomic, strong)UITextField * textFieldPassword;
@property(nonatomic, strong)UIButton * buttonLogin;
@property(nonatomic, strong)UIButton * buttonRegister;

@property(nonatomic, strong)Management * management;
@property(nonatomic, strong)Account * newsAccount;

@property(nonatomic, strong)UITabBarController * tbController;

@end
