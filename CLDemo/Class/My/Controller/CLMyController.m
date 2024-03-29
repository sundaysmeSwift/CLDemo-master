

//
//  MeController.m
//  CLDemo
//
//  Created by JmoVxia on 2016/11/17.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "CLMyController.h"
#import "CLDemo-Swift.h"
#import "CLChangeLanguageController.h"
#import "CLChangeFontSizeController.h"
#import "CLRotateAnimationController.h"
#import "CLPasswordViewController.h"
#import "CLLogViewController.h"
#import "CLInputToolbarController.h"
#import "CLBankCardScanController.h"
#import "CLCardController.h"
#import "CLWaveViewController.h"
#import "CLBubbleViewViewController.h"
#import "CLCustomQRCodeViewController.h"

@interface CLMyController ()<UITableViewDelegate,UITableViewDataSource>

/**tableview*/
@property (nonatomic, strong) UITableView *tableView;
/**数据源*/
@property (nonatomic, strong) NSMutableArray<NSString *> *arrayDS;
///控制器数组
@property (nonatomic, strong) NSMutableArray<Class> *controllerArray;

@end

@implementation CLMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"我的", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDS.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.arrayDS[indexPath.row];
    cell.textLabel.font = [UIFont clFontOfSize:18];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    });
    Class class = [self.controllerArray objectAtIndex:indexPath.row];
    UIViewController *controller =  (UIViewController *)[[class alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (UITableView *) tableView{
    if (_tableView == nil){
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *) arrayDS {
    if (_arrayDS == nil) {
        _arrayDS = [[NSMutableArray alloc] init];
        [_arrayDS addObject:NSLocalizedString(@"切换语言", nil)];
        [_arrayDS addObject:NSLocalizedString(@"修改字号", nil)];
        [_arrayDS addObject:[NSLocalizedString(@"转子动画", nil) stringByAppendingString:@"-OC"]];
        [_arrayDS addObject:[NSLocalizedString(@"转子动画", nil) stringByAppendingString:@"-Swift"]];
        [_arrayDS addObject:NSLocalizedString(@"旋转图片", nil)];
        [_arrayDS addObject:[NSLocalizedString(@"自定义密码框", nil) stringByAppendingString:@"-OC"]];
        [_arrayDS addObject:[NSLocalizedString(@"自定义密码框", nil) stringByAppendingString:@"-Swift"]];
        [_arrayDS addObject:NSLocalizedString(@"日志", nil)];
        [_arrayDS addObject:NSLocalizedString(@"自定义输入工具条", nil)];
        [_arrayDS addObject:NSLocalizedString(@"银行卡识别", nil)];
        [_arrayDS addObject:NSLocalizedString(@"卡片视图", nil)];
        [_arrayDS addObject:[NSLocalizedString(@"波浪视图", nil) stringByAppendingString:@"-OC"]];
        [_arrayDS addObject:[NSLocalizedString(@"波浪视图", nil) stringByAppendingString:@"-Swift"]];
        [_arrayDS addObject:NSLocalizedString(@"气泡拖拽", nil)];
        [_arrayDS addObject:NSLocalizedString(@"自定义输入框", nil)];
        [_arrayDS addObject:NSLocalizedString(@"自定义二维码", nil)];
    }
    return _arrayDS;
}

- (NSMutableArray *) controllerArray {
    if (_controllerArray == nil) {
        _controllerArray = [[NSMutableArray alloc] init];
        [_controllerArray addObject:[CLChangeLanguageController class]];
        [_controllerArray addObject:[CLChangeFontSizeController class]];
        [_controllerArray addObject:[CLRotateAnimationController class]];
        [_controllerArray addObject:[CLRotateAnimationSwiftController class]];
        [_controllerArray addObject:[CLRotatingPictureViewController class]];
        [_controllerArray addObject:[CLPasswordViewController class]];
        [_controllerArray addObject:[CLPasswordViewSwiftController class]];
        [_controllerArray addObject:[CLLogViewController class]];
        [_controllerArray addObject:[CLInputToolbarController class]];
        [_controllerArray addObject:[CLBankCardScanController class]];
        [_controllerArray addObject:[CLCardController class]];
        [_controllerArray addObject:[CLWaveViewController class]];
        [_controllerArray addObject:[CLWaveSwiftViewController class]];
        [_controllerArray addObject:[CLBubbleViewViewController class]];
        [_controllerArray addObject:[CLTextViewViewController class]];
        [_controllerArray addObject:[CLCustomQRCodeViewController class]];
    }
    return _controllerArray;
}

-(void)dealloc {
    CLLog(@"我的页面销毁了");
}

@end
