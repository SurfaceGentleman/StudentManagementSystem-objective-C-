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
    
    //_management = [Management new];
    
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
    
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 280, 340, 40)];
    _scoreTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    _scoreTextField.placeholder = @"学生已找到,请重新录入成绩";
    _scoreTextField.hidden = YES;
    //添加左图片
    UIImageView * imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    imageViewUserName.frame = CGRectMake(0, 0, 40, 40);
    _idTextField.leftView = imageViewUserName;
    _idTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_idTextField];
    [self.view addSubview:_scoreTextField];
    
    //按钮
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.frame = CGRectMake(40, 380, 340, 50);
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_searchButton setTitle:@"学号查询🔍" forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(clickToSearch) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [_searchButton.layer setMasksToBounds:YES];
    //半径
    [_searchButton.layer setCornerRadius:15];
    //宽度
    [_searchButton.layer setBorderWidth:2];
    //边框颜色
    [_searchButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_searchButton];
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _changeButton.frame = CGRectMake(40, 380, 340, 50);
    [_changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_changeButton setTitle:@"点击修改✒️" forState:UIControlStateNormal];
    [_changeButton addTarget:self action:@selector(clickToChange) forControlEvents:UIControlEventTouchUpInside];
    //允许边界超出
    [_changeButton.layer setMasksToBounds:YES];
    //半径
    [_changeButton.layer setCornerRadius:15];
    //宽度
    [_changeButton.layer setBorderWidth:2];
    //边框颜色
    [_changeButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_changeButton];
    _changeButton.hidden = YES;
    
    //给新学生初始化
    _newsScoreStudent = [[_management getInformationOfTheStudentWithId:_idTextField.text] copy];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickToPop)];
    leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)clickToPop
{
    [self.delegateChanging getAfterChangingArray:_management.studentMutableArray];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickToSearch
{
    if (YES == [_management studentInData:_idTextField.text]) {
        
        _newsScoreStudent = [[_management getInformationOfTheStudentWithId:_idTextField.text] copy];
        _changeButton.hidden = NO;
        _searchButton.hidden = YES;
        _scoreTextField.hidden = NO;
        _idTextField.hidden = YES;
        //添加提示信息
        //提示字符串
        NSString * nameStr = [NSString stringWithFormat:@"姓名:%@", _newsScoreStudent.nameStr];
        NSString * classStr = [NSString stringWithFormat:@"班级:%@", _newsScoreStudent.classStr ];
        NSString * idStr = [NSString stringWithFormat:@"学号:%s", [_newsScoreStudent.idStr UTF8String]];
        NSString * scoreStr = [NSString stringWithFormat:@"成绩:%@", _newsScoreStudent.score];
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"搜索成功" message:@"下面是该学生现在的资料" preferredStyle:UIAlertControllerStyleAlert];
        
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
    }
    else {
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"该学号不存在" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * backAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:backAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)clickToChange
{
    if (YES == [_management studentInData:_idTextField.text]) {
        
        _newsScoreStudent = [[_management getInformationOfTheStudentWithId:_idTextField.text] copy];
        _scoreTextField.hidden = NO;
        _newsScoreStudent.score = _scoreTextField.text;
        [_management deleteStudentWithId:_idTextField.text];
        [_management addStudent:_newsScoreStudent];
    }
    else{
        //添加提示信息
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"该学号不存在" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * backAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:backAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    _scoreTextField.hidden = YES;
    _changeButton.hidden = YES;
    _searchButton.hidden = NO;
    _idTextField.hidden = NO;
    _idTextField.text = nil;
    NSLog(@"%@", _newsScoreStudent.score);
    //添加提示信息
    //提示字符串
    NSString * nameStr = [NSString stringWithFormat:@"姓名:%@", _newsScoreStudent.nameStr];
    NSString * classStr = [NSString stringWithFormat:@"班级:%@", _newsScoreStudent.classStr ];
    NSString * idStr = [NSString stringWithFormat:@"学号:%s", [_newsScoreStudent.idStr UTF8String]];
    NSString * scoreStr = [NSString stringWithFormat:@"成绩:%@", _newsScoreStudent.score];
    //添加提示信息
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"修改成功" message:@"下面是该学生修改后的资料" preferredStyle:UIAlertControllerStyleAlert];
    
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
