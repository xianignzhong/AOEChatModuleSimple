//
//  AOEChatViewController.m
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AOEChatViewController.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#elif __has_include("Masonry/Masonry.h")
#import "Masonry/Masonry.h"
#else
#import "Masonry.h"
#endif

#import "AOEChatKit.h"

@interface AOEChatViewController ()

/**
 聊天背景图片
 */
@property (nonatomic, strong)UIImageView *bgImageView;

/**
 Message内容
 */
@property (nonatomic, strong)UITableView *tableView;

/**
 底部编辑区域z
 */
@property (nonatomic, strong)AOEChatKeyboard *chatKeyboard;

@end

@implementation AOEChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self aoe_setupViews];
    
    [self aoe_setupLayouts];
    
    [self aoe_updateKeyBoard];
}

-(void)aoe_setupViews{
    
    [self.view addSubview:self.bgImageView];
    
    [self.view addSubview:self.chatKeyboard];
    
    [self.view addSubview:self.tableView];
}

-(void)aoe_setupLayouts{
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(self.view).mas_offset(UIEdgeInsetsZero);
    }];
    
    [self.chatKeyboard mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.mas_equalTo(self.view);
        
        if (AOEChat_iPhoneX) {
            
            make.height.mas_equalTo(83);
        }else{
            make.height.mas_equalTo(49);
        }
    }];
}

-(void)aoe_updateKeyBoard{
    
//    [self.chatKeyboard keyboardUIMasonryUpdate:^(UpdateChatKeyboardType type, CGFloat newToolBarHeight) {
//
//        if (newToolBarHeight !=0) {
//
//            [self.chatKeyboard mas_updateConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(CGRectGetHeight(self.chatKeyboard.bounds) + newToolBarHeight);
//            }];
//
//            [UIView animateWithDuration:0.25 animations:^{
//
//                [self.view layoutIfNeeded];
//
//            } completion:^(BOOL finished) {
//
//            }];
//        }
//
//    }];
}

#pragma mark - <AOEChatConfigProtocol>
-(void)setBgColor:(UIColor *)color{
    
    self.view.backgroundColor = color;
}

-(void)setBgImage:(UIImage *)image{
    
    self.bgImageView.image = image;
}

#pragma mark - <Test>
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter/getter
-(UIImageView *)bgImageView{
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc]init];
    }
    
    return _bgImageView;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor redColor];
    }
    
    return _tableView;
}

-(AOEChatKeyboard *)chatKeyboard{
    
    if (!_chatKeyboard) {
        
        _chatKeyboard = [[AOEChatKeyboard alloc]init];
        _chatKeyboard.backgroundColor = AOEChat_KeyBoardColor;
    }
    
    return _chatKeyboard;
}

@end
