//
//  UIImage+Color.h
//  YMTools
//
//  Created by jjhb on 2021/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)
/**
 *  根据颜色生成一张图片
 *  @param imageName 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
