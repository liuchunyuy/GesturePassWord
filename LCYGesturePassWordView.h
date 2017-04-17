//
//  LCYGesturePassWordView.h
//  GesturePassWord
//
//  Created by GavinHe on 2017/4/17.
//  Copyright © 2017年 Liu Chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCYGesturePassWordView;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@protocol LCYGesturePassWordDelegate <NSObject>

- (void)gesturePassWordView:(LCYGesturePassWordView *)lockView drawRectFinished:(NSMutableString *)gesturePassword;

@end

@interface LCYGesturePassWordView : UIView

@property (assign, nonatomic) id<LCYGesturePassWordDelegate> delegate;
@end
