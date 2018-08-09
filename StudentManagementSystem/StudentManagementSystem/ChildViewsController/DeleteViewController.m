//
//  DeleteViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_management = [Management new];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //提示文字
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 110, 300, 120)];
    tipLabel.font = [UIFont systemFontOfSize:35];
    tipLabel.text = @"删除🤚";
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
    [_searchButton setTitle:@"点击删除🐳" forState:UIControlStateNormal];
    //允许边界超出
    [_searchButton.layer setMasksToBounds:YES];
    //半径
    [_searchButton.layer setCornerRadius:15];
    //宽度
    [_searchButton.layer setBorderWidth:2];
    //边框颜色
    [_searchButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_searchButton];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickToPop)];
    leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)clickToPop
{
    [self.delegateDelete  getAfterDeletingArray:_management.studentMutableArray];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickToSearch
{
    
    if (YES == [_management studentInData:_idTextField.text]) {
        StudentInformation * willBeDeleteStudent = [[_management getInformationOfTheStudentWithId:_idTextField.text] copy];
        //提示字符串
        NSString * nameStr = [NSString stringWithFormat:@"姓名:%@", willBeDeleteStudent.nameStr];
        NSString * classStr = [NSString stringWithFormat:@"班级:%@", willBeDeleteStudent.classStr ];
        NSString * idStr = [NSString stringWithFormat:@"学号:%s", [willBeDeleteStudent.idStr UTF8String]];
        NSString * scoreStr = [NSString stringWithFormat:@"成绩:%@", willBeDeleteStudent.score];
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"删除成功" message:@"该学生已被删除" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * name = [UIAlertAction actionWithTitle:nameStr style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction * class = [UIAlertAction actionWithTitle:classStr style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * id = [UIAlertAction actionWithTitle:idStr style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction * score = [UIAlertAction actionWithTitle:scoreStr style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction * backAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction: name];
        [alert addAction:class];
        [alert addAction:id];
        [alert addAction:score];
        [alert addAction:backAction];
        [self presentViewController: alert animated: YES completion:nil];
        [_management deleteStudentWithId:_idTextField.text];
        _idTextField.text = nil;
    }
    else {
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"删除失败" message:@"该学号不存在" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: defaultAction];
        [self presentViewController: alert animated: YES completion:nil];
    }
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
