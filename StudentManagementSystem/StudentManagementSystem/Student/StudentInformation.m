//
//  StudentInformation.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "StudentInformation.h"

@implementation StudentInformation

-(id)copyWithZone:(NSZone *)zone
{
    StudentInformation * studentInformation = [[[self class] allocWithZone:zone] init];
    studentInformation.nameStr = self.nameStr;
    studentInformation.idStr = self.idStr;
    studentInformation.classStr = self.classStr;
    studentInformation.score = self.score;
    return studentInformation;
}

- (id)init
{
    if(self = [super init]) {
        self.idStr = @"0";
        self.nameStr = @"佚名";
        self.classStr = @"nil";
        self.score = 0;
    }
    return self;
}                   

@end
