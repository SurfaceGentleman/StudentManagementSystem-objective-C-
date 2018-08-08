//
//  SearchViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"

@interface SearchViewController : UIViewController

@property(nonatomic, strong)UITableView * tableView;

@property(nonatomic, strong)UITextField *idTextField;
@property(nonatomic, strong)UIButton * searchButton;

@property(nonatomic, strong)Management * management;

@end
