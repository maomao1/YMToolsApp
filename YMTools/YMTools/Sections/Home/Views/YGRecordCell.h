//
//  YGRecordCell.h
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static NSString *const YGRecordCellId = @"YGRecordCell_identifier";
@interface YGRecordCell : UITableViewCell
@property (nonatomic , strong) UILabel     *titleLabel;
@property (nonatomic , strong) UILabel     *contentLabel;
@property (nonatomic , strong) UILabel     *timeLabel;

@end

NS_ASSUME_NONNULL_END
