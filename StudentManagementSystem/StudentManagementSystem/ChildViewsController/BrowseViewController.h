//
//  BrowseViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"

@interface BrowseViewController : UIViewController

@property(nonatomic, strong)UITableView * tableView;

@property(nonatomic, strong)Management * management;

@property(nonatomic, strong)NSMutableArray *studentNameMutableArray;
@property(nonatomic, strong)NSMutableArray *studentClassMutableArray;
@property(nonatomic, strong)NSMutableArray *studentIdMutableArray;
@property(nonatomic, strong)NSMutableArray *studentScoreMutableArray;

@end
