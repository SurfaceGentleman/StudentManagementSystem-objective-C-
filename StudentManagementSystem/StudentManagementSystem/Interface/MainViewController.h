//
//  MainViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController
@property(nonatomic, strong)UITableView * tableView;

@property(nonatomic, strong)Management *management;

@property(nonatomic, strong)UIButton * addStudentButton;
@property(nonatomic, strong)UIButton * deleteStudentButton;
@property(nonatomic, strong)UIButton * changeStudentButton;
@property(nonatomic, strong)UIButton * searchStudentButton;

@property(nonatomic, strong)UIButton * browseStudentButton;


@end
