//
//  AOEChatToolBar.h
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFTextView.h"

@protocol AOEChatToolBarDelegate <NSObject>

-(void)textViewUpdateContentHeight:(CGFloat)height;

@end

@interface AOEChatToolBar : UIImageView

@property (nonatomic, assign)id<AOEChatToolBarDelegate>delegate;

/**
 默认不允许开启
 */
@property (nonatomic, assign) BOOL allowSwitch;

/**
 默认开启
 */
@property (nonatomic, assign) BOOL allowVoice;
@property (nonatomic, assign) BOOL allowFace;
@property (nonatomic, assign) BOOL allowMore;

@end
