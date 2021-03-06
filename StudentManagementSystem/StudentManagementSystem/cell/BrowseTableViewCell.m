//
//  BrowseTableViewCell.m
//  StudentManagementSystem
//
//  Created by 开朗的男子 on 2018/8/8.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "BrowseTableViewCell.h"

@implementation BrowseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    _management = [Management new];
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 200, 20)];
        [self.contentView addSubview:_nameLabel];
        _classLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 20, 160, 20)];
        [self.contentView addSubview:_classLabel];
        _idLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 55, 160, 20)];
        [self.contentView addSubview:_idLabel];
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 55, 160, 20)];
        [self.contentView addSubview:_scoreLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //标签
    _nameLabel.textColor = [UIColor blackColor];
    //_nameLabel.text = _studentNameMutableArray[0];
    
    _idLabel.textColor = [UIColor blackColor];
    //_idLabel.text = _studentIdMutableArray[0];
    
    _classLabel.textColor = [UIColor blackColor];
    //_classLabel.text = _studentClassMutableArray[0];
    
    _scoreLabel.textColor = [UIColor redColor];
    //_scoreLabel.text = _studentScoreMutableArray[0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
