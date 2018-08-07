//
//  Account.m
//  Studengt
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)init
{
    if (self = [super init]) {
        self.userNameStr = nil;
        self.passwordStr = nil;
    }
    return self;
}

@end
