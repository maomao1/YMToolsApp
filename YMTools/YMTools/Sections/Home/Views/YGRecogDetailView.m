//
//  YGRecogDetailView.m
//  YMTools
//
//  Created by jjhb on 2021/1/28.
//

#import "YGRecogDetailView.h"
@interface YGRecogDetailView()
@property (nonatomic , strong) UIImageView  * contentImg;
//@property (nonatomic , strong)
@end
@implementation YGRecogDetailView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = DefaultBackGroundColor;
        [self setUp];
    }
    return self;
}
-(void)setUp{
    
    [self addSubview:self.contentText];
    [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}
-(UIImageView *)contentImg{
    if (!_contentImg) {
        _contentImg = [[UIImageView alloc]init];
        _contentImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _contentImg;
}

-(FSTextView *)contentText{
    if (!_contentText) {
        _contentText = [FSTextView textView];
        _contentText.borderWidth = 1.f;
        _contentText.borderColor = kLineColor;
        _contentText.placeholder = @"识别结果";
        _contentText.canPerformAction = NO;
        _contentText.placeholderFont = [UIFont systemFontOfSize:18];
        _contentText.font = [UIFont systemFontOfSize:18];
    }
    return _contentText;
}
@end
