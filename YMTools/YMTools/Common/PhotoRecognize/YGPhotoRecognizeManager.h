//
//  YGPhotoRecognizeManager.h
//  YMTools
//
//  Created by jjhb on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^CompleateBlock)(NSString *text);
@interface YGPhotoRecognizeManager : NSObject
+ (instancetype)recognizeCardManager;
- (void)recognizeWithImage:(UIImage *)cardImage compleate:(CompleateBlock)compleate;
@end

NS_ASSUME_NONNULL_END
