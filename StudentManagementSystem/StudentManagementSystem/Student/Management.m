//
//  Management.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Management.h"

@implementation Management

//-(id)copyWithZone:(NSZone *)zone
//{
//    Management * management = [[[self class] allocWithZone:zone] init];
//    management.accoutMutableArray = [self.accoutMutableArray mutableCopy];
//    management.studentMutableArray = [self.studentMutableArray mutableCopy];
//    return management;
//}

- (id)init
{
    if(self = [super init]) {
        //添加学生
        StudentInformation * student1 = [StudentInformation new];
        [student1 setIdStr:@"05179048"];
        [student1 setScore:@"98.3"];
        [student1 setNameStr:@"王臻"];
        [student1 setClassStr:@"微电子1702班"];
        StudentInformation * student2 = [StudentInformation new];
        [student2 setIdStr:@"05179047"];
        [student2 setScore:@"60"];
        [student2 setNameStr:@"巨佬"];
        [student2 setClassStr:@"计科1702班"];
        StudentInformation * student3 = [StudentInformation new];
        [student3 setIdStr:@"05179049"];
        [student3 setScore:@"80"];
        [student3 setNameStr:@"权小伟"];
        [student3 setClassStr:@"测控1702班"];
        StudentInformation * student4 = [StudentInformation new];
        [student4 setIdStr:@"05179041"];
        [student4 setScore:@"90"];
        [student4 setNameStr:@"张弛"];
        [student4 setClassStr:@"微电子1702"];
        //添加账户
        Account * account1 = [Account new];
        account1.userNameStr = @"1226568176";
        account1.passwordStr = @"1234567";
        
        
        //初始化数组
        _studentMutableArray = [NSMutableArray new];
        _accoutMutableArray = [NSMutableArray new];
        //添加的学生信息
        [_studentMutableArray addObject:student1];
        [_studentMutableArray addObject:student2];
        [_studentMutableArray addObject:student3];
        [_studentMutableArray addObject:student4];
        //添加账户信息
        [_accoutMutableArray addObject:account1];

    }
    return self;
}

//查询学生是否在信息中
- (BOOL)studentInData:(NSString *)idStr
{
    for (StudentInformation * temporaryStudentInformation in _studentMutableArray) {
        if ([temporaryStudentInformation.idStr isEqualToString:idStr] == YES) {
            return YES;
        }
    }
    return NO;
}
//删除一个学生
- (BOOL)deleteStudentWithId:(NSString *)idStr
{
    for (StudentInformation * temporaryStudentInformation in _studentMutableArray) {
        if ([temporaryStudentInformation.idStr isEqualToString:idStr] == YES) {
            [_studentMutableArray removeObject:temporaryStudentInformation];
            return YES;
        }
    }
    return NO;
}
//添加一个学生
- (BOOL)addStudent:(StudentInformation *)newStudent
{
    if (NO == [self studentInData:newStudent.idStr]) {
        [_studentMutableArray addObject:newStudent];
    }
    return YES;
}
//获取学生数据
//ID
- (StudentInformation *)getInformationOfTheStudentWithId:(NSString *)idStr
{
    for (StudentInformation * temporaryStudentInformation in _studentMutableArray) {
        if (YES == [temporaryStudentInformation.idStr isEqualToString:idStr]) {
            [self print:temporaryStudentInformation];
            return temporaryStudentInformation;
        }
    }
    return nil;
}
//修改学生信息
- (StudentInformation *)changeOnesInformation:(NSString *)idStr
{
    StudentInformation * newStudentInformation = [StudentInformation new];
    if (YES == [self studentInData:idStr]) {
        for(StudentInformation *temporaryStudent in _studentMutableArray) {
            if (YES == [idStr isEqualToString:temporaryStudent.idStr]) {
                newStudentInformation.idStr = temporaryStudent.idStr;
                newStudentInformation.nameStr = temporaryStudent.nameStr;
                newStudentInformation.classStr = temporaryStudent.classStr;
                return newStudentInformation;
            }
        }
    }
    return nil;
}

//输出学生信息
- (void)print:(StudentInformation *)student
{
    NSLog(@"姓名：%@， 学号：%@， 成绩：%@，班级：%@\n", student.nameStr, student.idStr, student.score, student.classStr);
}

//查询账户名是否在资料中
- (BOOL)isAccountInData:(NSString *)nameStr
{
    for(Account *temporaryAccount in _accoutMutableArray) {
        if (YES == [temporaryAccount.userNameStr isEqualToString:nameStr]) {
            return YES;
        }
    }
    return NO;
}
//添加一个账户
- (BOOL)addAccount:(Account *)newAccount
{
    if (NO == [self isAccountInData:newAccount.userNameStr]) {
        [self.accoutMutableArray addObject:newAccount];
        return YES;
    }
    return NO;
}

@end
