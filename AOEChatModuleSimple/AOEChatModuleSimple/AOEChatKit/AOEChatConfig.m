//
//  AOEChatConfig.m
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AOEChatConfig.h"

@implementation AOEChatConfig

-(void)addTarget:(id<AOEChatConfigProtocol>)target{
    
    //背景色
    if (target && [target respondsToSelector:@selector(setBgColor:)]) {
        
        if (self.bgColor) {
            
            [target setBgColor:self.bgColor];
        }else{
            
            [target setBgColor:[UIColor whiteColor]];
        }
    }
    
    //背景图片
    if (target && [target respondsToSelector:@selector(setBgImage:)]) {
        
        if (self.bgImage) {
            
            [target setBgImage:self.bgImage];
        }
    }
    
    
}



@end
