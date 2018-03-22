//
//  AOEChatKeyboardMacro.h
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#ifndef AOEChatKeyboardMacro_h
#define AOEChatKeyboardMacro_h

//界面尺寸
#define AOEChat_SCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define AOEChat_SCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)

//判断是否是iPhoneX
#define AOEChat_iPhoneX               (AOEChat_SCREEN_WIDTH == 375.f && AOEChat_SCREEN_HEIGHT == 812.f)

//ChatKeyBoard背景颜色
#define AOEChat_KeyBoardColor         [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.0f]

/**  判断文字中是否包含表情 */
#define IsTextContainFace(text) [text containsString:@"["] &&  [text containsString:@"]"] && [[text substringFromIndex:text.length - 1] isEqualToString:@"]"]

#endif /* AOEChatKeyboardMacro_h */
