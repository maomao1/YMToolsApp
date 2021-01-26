//
//  YGHomeViewController.m
//  YMTools
//
//  Created by jjhb on 2021/1/20.
//

#import "YGHomeViewController.h"
#import "YGHomeView.h"
@interface YGHomeViewController ()
@property (nonatomic , strong) YGHomeView *mainView;

@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViews];
}
-(void)configViews{
    [self.view addSubview:_mainView];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
-(YGHomeView *)mainView{
    if (!_mainView) {
        _mainView = [[YGHomeView alloc]init];
    }
    return  _mainView;
}


@end
