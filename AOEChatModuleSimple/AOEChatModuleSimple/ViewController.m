//
//  ViewController.m
//  AOEChatModuleSimple
//
//  Created by 夏宁忠 on 2018/3/13.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "ViewController.h"
#import "AOEChatKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)toChat:(id)sender {
    
    AOEChatViewController *chatVc = [[AOEChatViewController alloc]init];
    
    AOEChatConfig * config = [[AOEChatConfig alloc]init];
    config.bgColor = [UIColor blueColor];
    config.bgImage = [UIImage imageNamed:@"001.jpg"];
    
    [config addTarget:chatVc];
    
    [self.navigationController pushViewController:chatVc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
