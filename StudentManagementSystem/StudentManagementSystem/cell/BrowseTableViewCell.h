//
//  BrowseTableViewCell.h
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Management.h"

@interface BrowseTableViewCell : UITableViewCell

@property(nonatomic, strong)UILabel * nameLabel;
@property(nonatomic, strong)UILabel * classLabel;
@property(nonatomic, strong)UILabel * idLabel;
@property(nonatomic, strong)UILabel * scoreLabel;

@property(nonatomic, strong)Management * management;


@end
