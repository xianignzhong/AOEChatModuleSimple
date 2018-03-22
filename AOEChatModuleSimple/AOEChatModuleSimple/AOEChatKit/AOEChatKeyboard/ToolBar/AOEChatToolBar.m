//
//  AOEChatToolBar.m
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AOEChatToolBar.h"
#import "AOEChatKit.h"

@interface AOEChatToolBar ()

/**
 当前高度
 */
@property (nonatomic, assign)CGFloat textViewHeight;

/**
 文本框 当只有一行时输入框高度36， 当有2行以及以上的时候输入框高度 两行文字高度+上下边距2*2
 */
@property (nonatomic, strong) RFTextView *textView;

/**
 切换按钮
 */
@property (nonatomic, strong) UIButton *swithBtn;

/**
 语音按钮
 */
@property (nonatomic, strong) UIButton *voiceBtn;

/**
 表情按钮
 */
@property (nonatomic, strong) UIButton *faceBtn;

/**
 更多按钮
 */
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation AOEChatToolBar

-(id)init{
    
    self = [super init];
    if (self) {
        
        [self aoe_setInSelf];
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addKVO];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self aoe_setInSelf];
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addKVO];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self aoe_setInSelf];
        [self aoe_setupViews];
        [self aoe_setupLayouts];
        [self aoe_addKVO];
    }
    return self;
}

-(void)aoe_setInSelf{
    
    self.allowSwitch = NO;
    self.allowVoice = YES;
    self.allowFace = YES;
    self.allowMore = YES;
    
    self.userInteractionEnabled = YES;
    
    self.textViewHeight = 36;
}

-(void)aoe_setupViews{
    
    [self addSubview:self.textView];
    [self addSubview:self.swithBtn];
    [self addSubview:self.voiceBtn];
    [self addSubview:self.faceBtn];
    [self addSubview:self.moreBtn];
}

-(void)aoe_setupLayouts{
    
    [self resetFunctionButtons];
}

-(void)aoe_addKVO{
    
    //KVO text.contentSize
    [self addObserver:self forKeyPath:@"self.textView.contentSize" options:(NSKeyValueObservingOptionNew) context:nil];
}

#pragma mark - kvo回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if (object == self && [keyPath isEqualToString:@"self.textView.contentSize"]) {
        
        [self autoLayoutTextView:self.textView];
    }
}

#pragma mark - Private
-(void)resetFunctionButtons{
    
    //切换按钮
    if (self.allowSwitch) {
        
        [self.swithBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(40);
        }];
    }else{
        
        [self.swithBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(0);
        }];
    }
    
    //语音按钮
    if (self.allowVoice) {
        
        [self.voiceBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.swithBtn.mas_right);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(40);
        }];
        
    }else{
        
        [self.voiceBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(self.swithBtn.mas_right);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(0);
        }];
    }
    
    //更多按钮
    if (self.allowMore) {
        
        [self.moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
           
            make.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(40);
        }];
    }else{
        
        [self.moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(0);
        }];
    }
    
    //表情按钮
    if (self.allowFace) {
        
        [self.faceBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
           
            make.right.mas_equalTo(self.moreBtn.mas_left);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(40);
        }];
    }else{
        
        [self.faceBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(self.moreBtn.mas_left);
            make.bottom.mas_equalTo(self).mas_offset(-5);
            make.width.height.mas_equalTo(0);
        }];
    }
    
    //输入框
    [self.textView mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.voiceBtn.mas_right).mas_offset(5);
        make.right.mas_equalTo(self.faceBtn.mas_left).mas_offset(-5);
        make.top.mas_equalTo(7);
        make.bottom.mas_equalTo(-6);
    }];
}

- (CGFloat)fontWidth{
    
    return 21.f; //16号字体
}

- (CGFloat)maxLines{
    
    return 5;
}

- (CGFloat)getTextViewContentH:(RFTextView *)textView {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        return ceilf([textView sizeThatFits:textView.frame.size].height);
    } else {
        
        return textView.contentSize.height;
    }
}

-(void)autoLayoutTextView:(RFTextView *)textView{
    
    CGFloat maxHeight = [self fontWidth] * [self maxLines];
    CGFloat contentH = [self getTextViewContentH:textView];
    BOOL isShrinking = contentH < self.textViewHeight;
    CGFloat changeInHeight = contentH - self.textViewHeight;
    
    if (!isShrinking && (self.textViewHeight == maxHeight || textView.text.length == 0)) {
        
        changeInHeight = 0;
    }
    else {
        changeInHeight = MIN(changeInHeight, maxHeight - self.textViewHeight);
    }
    if (changeInHeight != 0.0f) {
        
        self.textViewHeight = MIN(contentH, maxHeight);
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(textViewUpdateContentHeight:)]) {
            
            [self.delegate textViewUpdateContentHeight:self.textViewHeight + 13];
        }
        
        [self adjustTextViewHeightBy:changeInHeight];
    }
    
    if (self.textViewHeight == maxHeight) {
        
        double delayInSeconds = 0.01;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            
            CGPoint bottomOffset = CGPointMake(0.0f, contentH - self.textView.bounds.size.height);
            [textView setContentOffset:bottomOffset animated:YES];
        });
    }
}

- (void)adjustTextViewHeightBy:(CGFloat)changeInHeight{
    
    NSUInteger numLines = MAX([self.textView numberOfLinesOfText],
                              [[self.textView.text componentsSeparatedByString:@"\n"] count] + 1);
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(CGRectGetHeight(self.bounds) + changeInHeight);
    }];
    
    self.textView.contentInset = UIEdgeInsetsMake((numLines >=5 ? .0f : 0.0f), 0.0f, (numLines >=5 ? .0f : 0.0f), 0.0f);
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.superview layoutIfNeeded];
        [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length-2, 1)];
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - setter/getter
-(RFTextView *)textView{
    
    if (!_textView) {
        
        _textView = [[RFTextView alloc]init];
    }
    
    return _textView;
}

-(UIButton *)swithBtn{
    
    if (!_swithBtn) {
        
        _swithBtn = [[UIButton alloc]init];
        [_swithBtn setImage:[UIImage imageNamed:@"AOEChat_switchDown"] forState:UIControlStateNormal];
    }
    
    return _swithBtn;
}

-(UIButton *)voiceBtn{
    
    if (!_voiceBtn) {
        
        _voiceBtn = [[UIButton alloc]init];
        [_voiceBtn setImage:[UIImage imageNamed:@"AOEChat_voice"] forState:UIControlStateNormal];
    }
    
    return _voiceBtn;
}

-(UIButton *)faceBtn{
    
    if (!_faceBtn) {
        
        _faceBtn = [[UIButton alloc]init];
        [_faceBtn setImage:[UIImage imageNamed:@"AOEChat_face"] forState:UIControlStateNormal];
    }
    
    return _faceBtn;
}

-(UIButton *)moreBtn{
    
    if (!_moreBtn) {
        
        _moreBtn = [[UIButton alloc]init];
        [_moreBtn setImage:[UIImage imageNamed:@"AOEChat_more"] forState:UIControlStateNormal];
    }
    
    return _moreBtn;
}


@end
