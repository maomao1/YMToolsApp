//
//  YGPhotoRecognizeManager.m
//  YMTools
//
//  Created by jjhb on 2021/1/28.
//

#import "YGPhotoRecognizeManager.h"
#import <TesseractOCR/TesseractOCR.h>
@implementation YGPhotoRecognizeManager
+ (instancetype)recognizeCardManager {
    static YGPhotoRecognizeManager *recognizeCardManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        recognizeCardManager = [[YGPhotoRecognizeManager alloc] init];
    });
    return recognizeCardManager;
}
 
- (void)recognizeWithImage:(UIImage *)cardImage compleate:(CompleateBlock)compleate {
    
    //利用TesseractOCR识别文字
    [self tesseractRecognizeImage:cardImage compleate:^(NSString *text) {
        compleate(text);
    }];
}
//利用TesseractOCR识别文字
- (void)tesseractRecognizeImage:(UIImage *)image compleate:(CompleateBlock)compleate {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        G8Tesseract *tesseract = [[G8Tesseract alloc] initWithLanguage:@"chi_sim"];
        tesseract.image = [image g8_blackAndWhite];
        tesseract.image = image;
        // Start the recognition
        [tesseract recognize];
        //执行回调
        dispatch_async(dispatch_get_main_queue(), ^{
            compleate(tesseract.recognizedText);
        });
        
    });
}
@end
