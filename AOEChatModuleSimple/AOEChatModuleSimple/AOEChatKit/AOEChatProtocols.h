//
//  AOEChatProtocols.h
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AOEChatConfigProtocol <NSObject>

/**
 设置聊天颜色

 @param color color
 */
-(void)setBgColor:(UIColor *)color;

/**
 设置聊天背景

 @param image image
 */
-(void)setBgImage:(UIImage *)image;

@end

@protocol AOEChatProtocols <NSObject>

@end
