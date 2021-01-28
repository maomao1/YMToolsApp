//
//  YGRecogDetailViewController.m
//  YMTools
//
//  Created by jjhb on 2021/1/27.
//

#import "YGRecogDetailViewController.h"
#import "YGRecogDetailView.h"
@interface YGRecogDetailViewController ()
@property (nonatomic ,strong) YGRecogDetailView *mainView;
@end

@implementation YGRecogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViews];
}
-(void)configViews{
    self.headTitle = @"取字详情";
    [self setRightBarItemWithImage: @""];
    [self.view addSubview:self.mainView];
    self.mainView.contentText.text = self.models.le_content;
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}
-(void)rightBarItemEvent{
    
}
-(YGRecogDetailView *)mainView{
    if (!_mainView) {
        _mainView = [[YGRecogDetailView alloc]init];
    }
    return  _mainView;
}

@end
