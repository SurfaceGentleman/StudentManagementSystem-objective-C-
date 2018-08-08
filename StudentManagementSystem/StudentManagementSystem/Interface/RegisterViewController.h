//
//  RegisterViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"

//代理delegate
@protocol ReturnTextDelegate

@required
- (void) getTextFieldUserName:(NSString *)textUserName;
- (void) getTextFieldPassword:(NSString *)textPassword;
@end

@protocol ReturnAccountDelegate

@required
- (void)getAccountArray:(NSMutableArray *)accountArray;

@end

@interface RegisterViewController : UIViewController

@property(nonatomic, strong)UITextField * textFieldUserName;
@property(nonatomic, strong)UITextField * textFieldPassword;
@property(nonatomic, strong)UIButton * buttonLogin;
@property(nonatomic, strong)UIButton * buttonRegister;

@property(nonatomic, strong)Management * management;

@property(nonatomic, strong)NSObject <ReturnTextDelegate> * delegate;

@property(nonatomic, strong)NSObject <ReturnAccountDelegate> * delegate2;

@end
