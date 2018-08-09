//
//  AddViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_management = [Management new];
    _addStudent = [StudentInformation new];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //提示文字
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 90, 300, 120)];
    tipLabel.font = [UIFont systemFontOfSize:35];
    tipLabel.text = @"添加➕";
    [self.view addSubview:tipLabel];
    
    //输入框
    _idTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 270, 340, 40)];
    _idTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _idTextField.placeholder = @"请输入该学生的学号";
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 210, 340, 40)];
    _nameTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _nameTextField.placeholder = @"请输入该学生的姓名";
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 330, 340, 40)];
    _classTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _classTextField.placeholder = @"请输入该学生的班级";
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 390, 340, 40)];
    _scoreTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _scoreTextField.placeholder = @"请输入该学生的成绩";
    
    //添加左图片
    UIImageView * imageViewId = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"手机"]];
    imageViewId.frame = CGRectMake(0, 0, 30, 30);
    _idTextField.leftView = imageViewId;
    _idTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView * imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"账户"]];
    imageViewUserName.frame = CGRectMake(0, 0, 30, 30);
    _nameTextField.leftView = imageViewUserName;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView * imageViewClass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"定位 (1)"]];
    imageViewClass.frame = CGRectMake(0, 0, 30, 30);
    _classTextField.leftView = imageViewClass;
    _classTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView * imageViewScore = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"正确 (2)"]];
    imageViewScore.frame = CGRectMake(0, 0, 30, 30);
    _scoreTextField.leftView = imageViewScore;
    _scoreTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_idTextField];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_classTextField];
    [self.view addSubview:_scoreTextField];
    
    //按钮
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton addTarget:self action:@selector(clickToAdd) forControlEvents:UIControlEventTouchUpInside];
    _searchButton.frame = CGRectMake(40, 470, 340, 50);
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_searchButton setTitle:@"点击添加学生🏠" forState:UIControlStateNormal];
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
    [self.addDelegate getAfterAddingArray:_management.studentMutableArray];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickToAdd
{
    if (YES == [_management studentInData:_idTextField.text]) {
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"添加失败" message:@"该学号已存在" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: defaultAction];
        [self presentViewController: alert animated: YES completion:nil];
    }
    else {
        _addStudent.nameStr = _nameTextField.text;
        _addStudent.idStr = _idTextField.text;
        _addStudent.score = _scoreTextField.text;
        _addStudent.classStr = _classTextField.text;
        
        //提示字符串
        NSString * nameStr = [NSString stringWithFormat:@"姓名:%@", _addStudent.nameStr];
        NSString * classStr = [NSString stringWithFormat:@"班级:%@", _addStudent.classStr ];
        NSString * idStr = [NSString stringWithFormat:@"学号:%s", [_addStudent.idStr UTF8String]];
        NSString * scoreStr = [NSString stringWithFormat:@"成绩:%@", _addStudent.score];
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"添加成功" message:@"新学生的所有信息如下" preferredStyle:UIAlertControllerStyleAlert];
        
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
        //[_management deleteStudentWithId:_idTextField.text];
        [_management addStudent:_addStudent];
        _idTextField.text = nil;
        _nameTextField.text = nil;
        _classTextField.text = nil;
        _scoreTextField.text = nil;
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
