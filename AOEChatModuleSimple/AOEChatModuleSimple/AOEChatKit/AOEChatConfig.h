//
//  AOEChatConfig.h
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AOEChatProtocols.h"

@interface AOEChatConfig : NSObject

/**
 聊天页面背景颜色 不设置默认白色
 */
@property (nonatomic, strong)UIColor *bgColor;

/**
 聊天页面背景图片
 */
@property (nonatomic, strong)UIImage *bgImage;

/**
 添加目标对象

 @param target VC
 */
-(void)addTarget:(id<AOEChatConfigProtocol>)target;

@end
