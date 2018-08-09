//
//  BrowseViewController.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "BrowseViewController.h"
#import "BrowseTableViewCell.h"

@interface BrowseViewController ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_management = [Management new];
    
    //添加学生的信息
    _studentNameMutableArray = [NSMutableArray new];
    _studentClassMutableArray = [NSMutableArray new];
    _studentIdMutableArray = [NSMutableArray new];
    _studentScoreMutableArray = [NSMutableArray new];
    
    
    
    for (StudentInformation *temporaryStudent in _management.studentMutableArray) {
        //提示字符串
        NSString * nameStr = [NSString stringWithFormat:@"姓名:%@", temporaryStudent.nameStr];
        NSString * classStr = [NSString stringWithFormat:@"班级:%@", temporaryStudent.classStr ];
        NSString * idStr = [NSString stringWithFormat:@"学号:%s", [temporaryStudent.idStr UTF8String]];
        NSString * scoreStr = [NSString stringWithFormat:@"成绩:%@", temporaryStudent.score];
        
        //添加信息
        [_studentNameMutableArray addObject:nameStr];
        [_studentClassMutableArray addObject:classStr];
        [_studentIdMutableArray addObject:idStr];
        [_studentScoreMutableArray addObject:scoreStr];
        
    }
    NSLog(@"%@", _studentClassMutableArray);
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickToPop)];
    leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)clickToPop
{
    [self.browseDelegate getAfterBrowsingArray:_management.studentMutableArray];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_management.studentMutableArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrowseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[BrowseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.nameLabel.text = _studentNameMutableArray[indexPath.section];
    cell.classLabel.text = _studentClassMutableArray[indexPath.section];
    cell.idLabel.text = _studentIdMutableArray[indexPath.section];
    cell.scoreLabel.text = _studentScoreMutableArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
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
