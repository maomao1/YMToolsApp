//
//  YGRecogResultModel.h
//  YMTools
//
//  Created by jjhb on 2021/1/28.
//

#import "YTGBasicModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGRecogResultModel : YTGBasicModels
@property (nonatomic, copy) NSString *le_content;
@property (nonatomic, copy) NSString *le_time;
@property (nonatomic, copy) NSString *le_type;   // 0 图片识别文字

@end

NS_ASSUME_NONNULL_END
