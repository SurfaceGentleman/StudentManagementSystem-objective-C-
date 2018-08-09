//
//  ChangeViewController.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"
#import "MainViewController.h"

@protocol ReturnAfterChangingArrayDelegate

@required
- (void)getAfterChangingArray:(NSMutableArray *)afterChangingStudentArray;

@end

@interface ChangeViewController : UIViewController

@property(nonatomic, strong)UITableView * tableView;

@property(nonatomic, strong)UITextField *idTextField;
@property(nonatomic, strong)UIButton * searchButton;
@property(nonatomic, strong)UIButton * changeButton;

@property(nonatomic, strong)Management * management;

@property(nonatomic, strong)UITextField *scoreTextField;

@property(nonatomic, strong)StudentInformation * newsScoreStudent;

//协议
@property(nonatomic, weak)NSObject <ReturnAfterChangingArrayDelegate> * delegateChanging;



@end
