//
//  YGHomeView.m
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import "YGHomeView.h"
#import "YGRecordCell.h"
@implementation YGHomeView
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = DefaultBackGroundColor;
        [self setUp];
    }
    return self;
}
-(void)setUp{
    self.mainTab.tableHeaderView = self.headerView;
    [self addSubview:self.mainTab];
    [self.mainTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}
-(void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    [self.mainTab reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kTopSpace;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.mainTab.frame.size.width, 40)];
    UILabel *title = [[UILabel alloc]init];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.textColor = UIColorFromRGBValue(0x333333);
    title.text = @"识别记录";
    [header addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kSpace);
        make.centerY.equalTo(header);
    }];
    return header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YGRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:YGRecordCellId];
    return  cell;
}
-(YGHomeTabHeader *)headerView{
    if (!_headerView) {
        _headerView = [[YGHomeTabHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2 + 115)];
    }
    return  _headerView;
}
-(UITableView *)mainTab{
    if(!_mainTab){
        _mainTab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _mainTab.backgroundColor = [UIColor whiteColor];
        _mainTab.delegate = self;
        _mainTab.dataSource = self;
        [_mainTab registerClass:[YGRecordCell class] forCellReuseIdentifier:YGRecordCellId];
        _mainTab.rowHeight = 60;
        _mainTab.sectionHeaderHeight = 5;
        _mainTab.sectionFooterHeight = 5;
        [self autoLayoutSizeContentView:_mainTab];
    }
    return _mainTab;
}
@end
