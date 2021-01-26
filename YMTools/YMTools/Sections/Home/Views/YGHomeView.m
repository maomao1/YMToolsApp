//
//  YGHomeView.m
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import "YGHomeView.h"
#import "YGRecordCell.h"
@implementation YGHomeView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = DefaultBackGroundColor;
        [self setUp];
    }
    return self;
}
-(void)setUp{
    [self addSubview:self.mainTab];
}
-(void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    [self.mainTab reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YGRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:YGRecordCellId];
    return  cell;
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
