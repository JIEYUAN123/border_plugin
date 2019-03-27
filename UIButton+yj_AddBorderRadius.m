//
//  UIButton+AddBorderRadius.m
//  uzmd
//
//  Created by YJ on 2018/12/25.
//  Copyright © 2018年 inhot. All rights reserved.
//

#import "UIButton+yj_AddBorderRadius.h"
#define DEFAULT_RADIUS_NUM 4

@implementation UIButton (yj_AddBorderRadius)
static char yjDefaultCNumberKey;
static char yjDefaultisNeedNum;
static char yjBorderNeedNum;
+ (void)load {
    Method N1 = class_getInstanceMethod([self class], @selector(diyButtonLayOut));
    Method N2 = class_getInstanceMethod([self class], @selector(layoutSubviews));
    method_exchangeImplementations(N1, N2);
}

- (void)diyButtonLayOut {
    [self diyButtonLayOut];
    if (self.borderNeedNum == 1) {
        return;
    }
    if (!self.isNeedNum) {
        if (self.cNumber) {
            [self setCornerByBezierPathWithNumber:self.cNumber];
        } else {
            [self setCornerByBezierPathWithNumber:DEFAULT_RADIUS_NUM];
        }
    } else {
        if ([self.isNeedNum intValue] == 1) {
            if (self.cNumber) {
                [self setCornerByBezierPathWithNumber:self.cNumber];
            } else {
                [self setCornerByBezierPathWithNumber:DEFAULT_RADIUS_NUM];
            }
        } else {
            
        }
        

    }
    self.borderNeedNum = 1;
    NSLog(@"添加border");
//    [self setCornerByBezierPathWithNumber:DEFAULT_RADIUS_NUM];
}
- (void)setCornerByBezierPathWithNumber: (CGFloat)number {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(number, number)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}
- (void)yj_SetIsNeedCorners:(BOOL)isNeed {
    if (isNeed) {
        self.isNeedNum = @1;
    } else {
        self.isNeedNum = @2;
    }
    
}
- (void)yj_SetBorderRadiusWithNumber:(CGFloat) radiusNum {
    
    self.cNumber = radiusNum;
}

- (CGFloat)cNumber {
    NSNumber *t = objc_getAssociatedObject(self, &yjDefaultCNumberKey);
    return (CGFloat)(t.floatValue);
}
- (void)setCNumber:(CGFloat)cNumber {
    objc_setAssociatedObject(self, &yjDefaultCNumberKey, @(cNumber), OBJC_ASSOCIATION_ASSIGN);
}

- (NSNumber *)isNeedNum {
    return objc_getAssociatedObject(self, &yjDefaultisNeedNum);
}
- (void)setIsNeedNum:(NSNumber *)isNeedNum {
    objc_setAssociatedObject(self, &yjDefaultisNeedNum, isNeedNum, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)borderNeedNum {
    NSNumber *num = objc_getAssociatedObject(self, &yjBorderNeedNum);
    return num.intValue;
}
- (void)setBorderNeedNum:(int) borderNeedNum {
    objc_setAssociatedObject(self, &yjBorderNeedNum, @(borderNeedNum), OBJC_ASSOCIATION_ASSIGN);
}
@end








