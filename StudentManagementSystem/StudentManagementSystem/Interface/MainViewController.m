//
//  MainViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Management.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "ChangeViewController.h"
#import "DeleteViewController.h"
#import "AddViewController.h"
#import "BrowseViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Management *management = [Management new];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //添加提示文字
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 60, 300, 120)];
    tipLabel.text = @"欢迎使用🌹";
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:tipLabel];
    
    //按钮
    
    //查询
    _searchStudentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchStudentButton addTarget:self action:@selector(clickToSearch) forControlEvents:UIControlEventTouchUpInside];
    [_searchStudentButton setTitle:@"查询📖" forState:UIControlStateNormal];
    _searchStudentButton.frame = CGRectMake(50, 190, 130, 130);
    [_searchStudentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //允许边界超出
    [_searchStudentButton.layer setMasksToBounds:YES];
    //半径
    [_searchStudentButton.layer setCornerRadius:15];
    //宽度
    [_searchStudentButton.layer setBorderWidth:2];
    //边框颜色
    [_searchStudentButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_searchStudentButton];
    //修改
    _changeStudentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_changeStudentButton addTarget:self action:@selector(clickToChange) forControlEvents:UIControlEventTouchUpInside];
    [_changeStudentButton setTitle:@"修改✍️" forState:UIControlStateNormal];
    _changeStudentButton.frame = CGRectMake(240, 190, 130, 130);
    [_changeStudentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //允许边界超出
    [_changeStudentButton.layer setMasksToBounds:YES];
    //半径
    [_changeStudentButton.layer setCornerRadius:15];
    //宽度
    [_changeStudentButton.layer setBorderWidth:2];
    //边框颜色
    [_changeStudentButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_changeStudentButton];
    //添加
    _addStudentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addStudentButton addTarget:self action:@selector(clickToAdd) forControlEvents:UIControlEventTouchUpInside];
    [_addStudentButton setTitle:@"添加➕" forState:UIControlStateNormal];
    _addStudentButton.frame = CGRectMake(240, 370, 130, 130);
    [_addStudentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //允许边界超出
    [_addStudentButton.layer setMasksToBounds:YES];
    //半径
    [_addStudentButton.layer setCornerRadius:15];
    //宽度
    [_addStudentButton.layer setBorderWidth:2];
    //边框颜色
    [_addStudentButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_addStudentButton];
    //删除
    _deleteStudentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteStudentButton addTarget:self action:@selector(clickToDelete) forControlEvents:UIControlEventTouchUpInside];
    [_deleteStudentButton setTitle:@"删除🤚" forState:UIControlStateNormal];
    _deleteStudentButton.frame = CGRectMake(50, 370, 130, 130);
    [_deleteStudentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //允许边界超出
    [_deleteStudentButton.layer setMasksToBounds:YES];
    //半径
    [_deleteStudentButton.layer setCornerRadius:15];
    //宽度
    [_deleteStudentButton.layer setBorderWidth:2];
    //边框颜色
    [_deleteStudentButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_deleteStudentButton];
    
    _browseStudentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_browseStudentButton addTarget:self action:@selector(clickToBrowse) forControlEvents:UIControlEventTouchUpInside];
    _browseStudentButton.frame = CGRectMake(50, 550, 320, 80);
    [_browseStudentButton setTitle:@"浏览学生信息" forState:UIControlStateNormal];
    [_browseStudentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //允许边界超出
    [_browseStudentButton.layer setMasksToBounds:YES];
    //半径
    [_browseStudentButton.layer setCornerRadius:15];
    //宽度
    [_browseStudentButton.layer setBorderWidth:2];
    //边框颜色
    [_browseStudentButton.layer setBorderColor:[UIColor colorWithRed:1.00 green:0.87 blue:0.00 alpha:1.00].CGColor];
    [self.view addSubview:_browseStudentButton];
}

- (void)clickToSearch
{
    SearchViewController * searchViewController = [SearchViewController new];
    [self.navigationController pushViewController:searchViewController animated:YES];
}

- (void)clickToAdd
{
    AddViewController * addViewController = [AddViewController new];
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (void)clickToDelete
{
    DeleteViewController * deleteViewController = [DeleteViewController new];
    [self.navigationController pushViewController:deleteViewController animated:YES];
}

- (void)clickToChange
{
    ChangeViewController * changeViewController = [ChangeViewController new];
    [self.navigationController pushViewController:changeViewController animated:YES];
}

- (void)clickToBrowse
{
    BrowseViewController * browerViewController = [BrowseViewController new];
    [self.navigationController pushViewController:browerViewController animated:YES];
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
