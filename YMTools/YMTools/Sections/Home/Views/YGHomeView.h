//
//  YGHomeView.h
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import <UIKit/UIKit.h>
#import "YGHomeTabHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGHomeView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView      *mainTab;
@property (nonatomic ,strong) NSMutableArray   *dataSource;
@property (nonatomic ,strong) YGHomeTabHeader  *headerView;
@end

NS_ASSUME_NONNULL_END
