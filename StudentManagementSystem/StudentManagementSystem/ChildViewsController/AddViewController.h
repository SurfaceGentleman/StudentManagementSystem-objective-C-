//
//  AddViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"
#import "MainViewController.h"

@protocol ReturnAfterAddingArrayDelegate

@required
- (void)getAfterAddingArray:(NSMutableArray *)afterAddingStudentArray;

@end


@interface AddViewController : UIViewController

@property(nonatomic, strong)UITableView * tableView;


@property(nonatomic, strong)UITextField *idTextField;
@property(nonatomic, strong)UITextField *nameTextField;
@property(nonatomic, strong)UITextField *classTextField;
@property(nonatomic, strong)UITextField *scoreTextField;

@property(nonatomic, strong)UIButton * searchButton;

@property(nonatomic, strong)Management * management;

@property(nonatomic, strong)StudentInformation * addStudent;

//协议
@property(nonatomic, weak)NSObject <ReturnAfterAddingArrayDelegate>* addDelegate;

@end
