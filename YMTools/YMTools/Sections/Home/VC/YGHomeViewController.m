//
//  YGHomeViewController.m
//  YMTools
//
//  Created by jjhb on 2021/1/20.
//

#import "YGHomeViewController.h"
#import "YGHomeView.h"
#import "YGPhotoRecognizeManager.h"
#import "YGRecogDetailViewController.h"
#import "YGDateTools.h"

@interface YGHomeViewController ()<YGHomeTabHeaderDelegate,TZImagePickerControllerDelegate>
@property (nonatomic , strong) YGHomeView *mainView;

@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViews];
}
-(void)configViews{
    self.mainView.headerView.delegate = self;
    [self.view addSubview:self.mainView];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}
-(YGHomeView *)mainView{
    if (!_mainView) {
        _mainView = [[YGHomeView alloc]init];
    }
    return  _mainView;
}
-(void)YgRecognizeImageWithTesseract:(UIImage*)image{
    kWeakSelf;
    [YGLoadingTools beginLoading];
    [[YGPhotoRecognizeManager recognizeCardManager] recognizeWithImage:image compleate:^(NSString * _Nonnull text) {
        YGRecogResultModel *model = [[YGRecogResultModel alloc]init];
        model.le_content = text;
        model.le_type    = @"0";
        model.le_time    = [YGDateTools getNowTimeTimestamp];
        [YGLoadingTools endLoading];
        [weakSelf pushResultVC:model];
    }];
}
-(void)pushResultVC:(YGRecogResultModel*)model{
    
    YGRecogDetailViewController *regcogDetailVC = [YGRecogDetailViewController new];
    regcogDetailVC.models = model;
    regcogDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:regcogDetailVC animated:YES];
    
}
/****---YGHomeTabHeaderDelegate---****/
-(void)takePhotoCallBack{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [self YgRecognizeImageWithTesseract:photos.firstObject];
    }];
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
-(void)fanyiCallBack{
    
}
-(void)fapiaoCallBack{
    
}
-(void)IdCardCallBack{
    
}
///
@end
