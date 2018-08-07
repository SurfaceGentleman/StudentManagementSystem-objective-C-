//
//  StudentInformation.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentInformation : NSObject

@property(nonatomic, copy)NSString * nameStr;
@property(nonatomic, copy)NSString * idStr;
@property(nonatomic, copy)NSString * classStr;

@property(nonatomic, assign)double score;

//初始化
- (id)init;

@end
