//
//  ChangeViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _management = [Management new];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //提示文字
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 110, 300, 120)];
    tipLabel.font = [UIFont systemFontOfSize:35];
    tipLabel.text = @"修改✍️";
    [self.view addSubview:tipLabel];
    
    //输入框
    _idTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 280, 340, 40)];
    _idTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _idTextField.placeholder = @"请输入您的学号";
    //添加左图片
    UIImageView * imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    imageViewUserName.frame = CGRectMake(0, 0, 40, 40);
    _idTextField.leftView = imageViewUserName;
    _idTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_idTextField];
    
    //按钮
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton addTarget:self action:@selector(clickToSearch) forControlEvents:UIControlEventTouchUpInside];
    _searchButton.frame = CGRectMake(40, 380, 340, 50);
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_searchButton setTitle:@"点击修改✒️" forState:UIControlStateNormal];
    //允许边界超出
    [_searchButton.layer setMasksToBounds:YES];
    //半径
    [_searchButton.layer setCornerRadius:15];
    //宽度
    [_searchButton.layer setBorderWidth:2];
    //边框颜色
    [_searchButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_searchButton];
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
