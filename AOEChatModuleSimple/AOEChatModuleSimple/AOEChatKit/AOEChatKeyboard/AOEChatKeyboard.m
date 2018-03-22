//
//  AOEChatKeyboard.m
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AOEChatKeyboard.h"
#import "AOEChatKit.h"
#import "AOEChatToolBar.h"

@interface AOEChatKeyboard ()<AOEChatToolBarDelegate>

/**
 顶部ToolBar
 */
@property (nonatomic, strong) AOEChatToolBar *chatToolBar;

/**
 toolBar的高度 跟随输入的内容更新高度的值
 */
@property (nonatomic, assign)CGFloat toolBarHeight;

/**
 键盘功能区高度
 */
@property (nonatomic, assign)CGFloat keyboardHeight;


@end

@implementation AOEChatKeyboard

-(id)init{
    
    self = [super init];
    if (self) {
        
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addNotify];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addNotify];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addNotify];
    }
    
    return self;
}

-(void)aoe_setupViews{
    
    [self addSubview:self.chatToolBar];
}

-(void)aoe_setupLayouts{
    
    [self.chatToolBar mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(49);
    }];
}

-(void)aoe_addNotify{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark - Private
- (void)keyBoardWillChangeFrame:(NSNotification *)notification{
    
    NSDictionary *info = [notification userInfo];
    //获取动画时间
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //获取动画结束状态的fram
    CGRect beginRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    //获取动画结束状态的fram
    CGRect endRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if ((beginRect.origin.y <= endRect.origin.y) && endRect.origin.y >= AOEChat_SCREEN_HEIGHT) {//键盘复位 考虑是否还有输入的文字
            
            self.keyboardHeight = 0;
            //有可能输入框内有内容取消键盘S,所以使用获取KeyBoard高度-键盘的高度
            if (AOEChat_iPhoneX) {
                
                make.height.mas_equalTo(self.keyboardHeight + self.toolBarHeight + 34);
            }else{
                
                make.height.mas_equalTo(self.keyboardHeight + self.toolBarHeight);
            }
            
        }else{
            
            self.keyboardHeight = endRect.size.height;
            make.height.mas_equalTo(self.keyboardHeight + self.toolBarHeight);
        }
    }];
    
    [UIView animateWithDuration:duration animations:^{
        
        [self.superview layoutIfNeeded];
    }];
}

#pragma mark - <AOEChatToolBarDelegate>
-(void)textViewUpdateContentHeight:(CGFloat)height{
    
    self.toolBarHeight = height;
    
    if (self.keyboardHeight != 0 ) {
        
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(self.keyboardHeight + height);
        }];
        
        [UIView animateWithDuration:0.25 animations:^{
            
            [self.superview layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(void)dealloc{

    //移除键盘通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark - setter/getter
- (AOEChatToolBar *)chatToolBar{
    if (!_chatToolBar) {
        
        _chatToolBar = [[AOEChatToolBar alloc] init];
        _chatToolBar.delegate = self;
    }
    return _chatToolBar;
}

-(CGFloat)toolBarHeight{
    
    if (!_toolBarHeight) {
        
        _toolBarHeight = 49;
    }
    
    return _toolBarHeight;
}

@end
