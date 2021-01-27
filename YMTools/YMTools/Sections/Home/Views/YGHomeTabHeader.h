//
//  YGHomeTabHeader.h
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import <UIKit/UIKit.h>

@protocol YGHomeTabHeaderDelegate <NSObject>

- (void)takePhotoCallBack;
- (void)fanyiCallBack;
- (void)fapiaoCallBack;
- (void)IdCardCallBack;

@end
NS_ASSUME_NONNULL_BEGIN

@interface YGHomeTabHeader : UIView
@property (weak , nonatomic) id <YGHomeTabHeaderDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
