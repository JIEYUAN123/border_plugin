//
//  UIButton+AddBorderRadius.h
//  uzmd
//
//  Created by YJ on 2018/12/25.
//  Copyright © 2018年 inhot. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (yj_AddBorderRadius)

- (void)yj_SetIsNeedCorners:(BOOL)isNeed;  //默认开启全局圆角，可以控制局部的按钮的圆角
- (void)yj_SetBorderRadiusWithNumber:(CGFloat) radiusNum; //具体可以根据自己喜好修改局部按钮圆角大小,默认是4


@end

NS_ASSUME_NONNULL_END


