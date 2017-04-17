//
//  LCYGesturePassWordViewController.h
//  GesturePassWord
//
//  Created by GavinHe on 2017/4/17.
//  Copyright © 2017年 Liu Chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ZLUnlockType) {
    LCYUnlockTypeCreatePsw, // 创建手势密码
    LCYUnlockTypeValidatePsw // 校验手势密码
};

@interface LCYGesturePassWordViewController : UIViewController

+ (void)deleteGesturesPassword;//删除手势密码
+ (NSString *)gesturesPassword;//获取手势密码

- (instancetype)initWithUnlockType:(ZLUnlockType)unlockType;
@end
