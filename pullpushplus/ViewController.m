//
//  ViewController.m
//  pullpushplus
//
//  Created by FDC-iOS on 16/9/5.
//  Copyright © 2016年 meilun. All rights reserved.
//

#import "ViewController.h"
#import "YS_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)nextClick:(UIBarButtonItem *)sender
{
    [self.navigationController pushViewController:[YS_ViewController new] animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController pushViewController:[YS_ViewController new] animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
