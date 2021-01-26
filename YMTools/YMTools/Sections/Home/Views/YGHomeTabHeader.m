//
//  YGHomeTabHeader.m
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import "YGHomeTabHeader.h"
#import "SDCycleScrollView.h"

#define kItemSizeWidth  60
@interface YGHomeTabHeader()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView * scrollView;

@end
@implementation YGHomeTabHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}
-(void)setUp{
    [self addSubview:self.scrollView];
    NSArray * titles = @[@"拍照取字",@"拍照翻译",@"发票识别",@"身份证"];
    NSArray * images = @[@"",@"",@"",@""];
    CGFloat gap = (kScreenWidth - kItemSizeWidth * titles.count)/(titles.count + 1);
    for (int i = 0; i < titles.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(gap *(i+1), CGRectGetMaxY(self.scrollView.frame)+ 15, kItemSizeWidth, kItemSizeWidth);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius  = kItemSizeWidth/2 ;
        button.tag = 100001 + i ;
        button.backgroundColor = [UIColor lightGrayColor];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClick:) forControlEvents: UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_bottom).offset(15);
            make.left.mas_equalTo(gap *(i+1) + i*kItemSizeWidth);
            make.size.mas_equalTo(CGSizeMake(kItemSizeWidth, kItemSizeWidth));
        }];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = UIColorFromRGBValue(0x333333);
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = titles[i];
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(button.mas_centerX);
            make.top.equalTo(button.mas_bottom).offset(10);
        }];
        
    }
}
-(void)btnClick:(UIButton*)btn{
    
}
- (SDCycleScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.currentPageDotColor = UIColorFromRGBValue(0xE9A400);
        _scrollView.pageDotColor = UIColorFromRGBValue(0xFFFFFF);
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _scrollView.pageControlDotSize = CGSizeMake(10, 10);
    }
    return _scrollView;
}


@end
