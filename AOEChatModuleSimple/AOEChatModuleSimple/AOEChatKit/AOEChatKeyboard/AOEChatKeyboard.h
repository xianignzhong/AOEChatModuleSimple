//
//  AOEChatKeyboard.h
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AOEChatKeyboard : UIView

/**
 *  是否开启语音, 默认开启
 */
@property (nonatomic, assign) BOOL allowVoice;

/**
 *  是否开启表情，默认开启
 */
@property (nonatomic, assign) BOOL allowFace;

/**
 *  是否开启更多功能，默认开启
 */
@property (nonatomic, assign) BOOL allowMore;

/**
 *  是否开启切换工具条的功能，默认关闭
 */
@property (nonatomic, assign) BOOL allowSwitch;

@end
