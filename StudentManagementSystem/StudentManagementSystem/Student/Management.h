//
//  Management.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentInformation.h"
#import "Account.h"

@interface Management : NSObject
<NSCopying>

@property(nonatomic, strong)NSMutableArray * accoutMutableArray;
@property(nonatomic, strong)NSMutableArray * studentMutableArray;

- (id)init;


//学生

//学生在没在资料里面
- (BOOL)studentInData:(NSString *)idStr;

//查询学生的资料
//使用学号
- (StudentInformation *)getInformationOfTheStudentWithId:(NSString *)idStr;
//删除一个学生的信息
- (BOOL)deleteStudentWithId:(NSString *)idStr;
//添加一个学生的信息
- (BOOL)addStudent:(StudentInformation *)newStudent;
//修改一个学生的信息
- (StudentInformation *)changeOnesInformation:(NSString *)idStr;

//输出学生信息
- (void)print:(StudentInformation *)student;

//账户

//查询账户名在资料中
- (BOOL)isAccountInData:(NSString *)nameStr;
//添加一个账户
- (BOOL)addAccount:(Account *)newAccount;

@end
