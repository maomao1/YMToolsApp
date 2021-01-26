//
//  YGRecordCell.m
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import "YGRecordCell.h"

@implementation YGRecordCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if ([reuseIdentifier isEqualToString:YGRecordCellId]) {
            [self.contentView addSubview:self.titleLabel];
            [self.contentView addSubview:self.contentLabel];
            [self.contentView addSubview:self.timeLabel];
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(kSpace);
                make.top.mas_equalTo(5);
            }];
            [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-kSpace);
                make.top.mas_equalTo(5);
            }];
            [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.titleLabel);
                make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            }];
        }
    }
    return self;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = UIColorFromRGBValue(0x999999);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"* 取字 *";
    }
    return  _titleLabel;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textColor = UIColorFromRGBValue(0x999999);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return  _timeLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = UIColorFromRGBValue(0x333333);
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return  _contentLabel;
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
