//
//  YS_ViewController.m
//  pullpushplus
//
//  Created by FDC-iOS on 16/9/5.
//  Copyright © 2016年 meilun. All rights reserved.
//

#import "YS_ViewController.h"
#import "HMObjcSugar.h"


@interface YS_ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YS_ViewController {
    UIView          *_header;
    UITableView     *_tableView;
    UIImageView     *_imagView;
    UIView          *_line;
    UIStatusBarStyle _statusBarStyle;
}
#define kHeaderHeight 250
#define CELLID @"cell"
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self prepareHeader];
    self.view.backgroundColor = [UIColor whiteColor];
    _statusBarStyle = UIStatusBarStyleLightContent;
}
- (void)prepareTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.hm_width, self.view.hm_height)];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    _tableView.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
    [self.view addSubview:_tableView];
}
- (void)prepareHeader {
    _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.hm_width, kHeaderHeight)];
    _header.backgroundColor = [UIColor hm_colorWithHex:0xF8F8F8];
    [self.view addSubview:_header];
    
    _imagView = [[UIImageView alloc] initWithFrame:_header.bounds];
    _imagView.image = [UIImage imageNamed:@"dahai"];
    [_imagView setContentMode:UIViewContentModeScaleAspectFill];
    _imagView.layer.masksToBounds = YES;
    [_header addSubview:_imagView];
    
    CGFloat lineH = 1 / [UIScreen mainScreen].scale;
    _line = [[UIView alloc] initWithFrame:CGRectMake(0, _header.hm_height, _header.hm_width, lineH)];
    _line.backgroundColor = [UIColor lightGrayColor];
    [_header addSubview:_line];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:CELLID];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y + kHeaderHeight;
    if (offset < 0) {
        _imagView.alpha = 1;
        _header.hm_y = 0;
        _header.hm_height = kHeaderHeight - offset;
    }else{
        _imagView.alpha = 1;
        _header.hm_height = kHeaderHeight;
        CGFloat minOffset = kHeaderHeight - 64;
        _header.hm_y = minOffset > offset ? -offset : -minOffset;
        float progress = 1 - (offset / minOffset);
        _imagView.alpha = progress;
        _statusBarStyle = progress > 0.5 ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
    }
    _line.hm_y = _header.hm_height;
    _imagView.hm_height = _header.hm_height;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

@end





