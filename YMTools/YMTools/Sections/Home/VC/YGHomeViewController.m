//
//  YGHomeViewController.m
//  YMTools
//
//  Created by jjhb on 2021/1/20.
//

#import "YGHomeViewController.h"
#import "YGHomeView.h"
@interface YGHomeViewController ()<YGHomeTabHeaderDelegate,TZImagePickerControllerDelegate,G8TesseractDelegate>
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
   
    G8Tesseract *CardTesseract = [[G8Tesseract alloc] initWithLanguage:@"eng+chi_sim"];
    CardTesseract.image = [image g8_blackAndWhite];
    CardTesseract.image = image;
    [CardTesseract recognize];
    NSLog(@"%@",CardTesseract.recognizedText);
//    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng+chi_sim"];
//    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
//    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
//    operation.delegate = self;
//    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
//        NSString *recognizedText = tesseract.recognizedText;
//        NSLog(@"%@", recognizedText);
//        
//    };
    //
    
     //print the progress infos
    

}
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
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
