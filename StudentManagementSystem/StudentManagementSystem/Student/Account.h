//
//  Account.h
//  Studengt
//
//  Created by 开朗的男子 on 2018/8/7.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property(nonatomic, copy)NSString * userNameStr;
@property(nonatomic, copy)NSString * passwordStr;

- (id)init;
@end
