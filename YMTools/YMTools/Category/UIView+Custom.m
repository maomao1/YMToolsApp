//
//  UIView+Custom.m
//  YMTools
//
//  Created by jjhb on 2021/1/26.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

- (void)autoLayoutSizeContentView:(UIScrollView *)scrollView {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        if ([scrollView isKindOfClass:[UITableView class]]) {
            ((UITableView *)scrollView).estimatedSectionHeaderHeight = 0;
            ((UITableView *)scrollView).estimatedSectionFooterHeight = 0;
        }
    }
#endif
}
@end
