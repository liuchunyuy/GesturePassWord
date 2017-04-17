//
//  ViewController.m
//  GesturePassWord
//
//  Created by GavinHe on 2017/4/17.
//  Copyright © 2017年 Liu Chunyu. All rights reserved.
//

#import "ViewController.h"
#import "LCYGesturePassWordViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _array = @[@"创建手势密码",@"验证手势密码",@"删除手势密码"];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - Table view data source / delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) { // 创建手势密码
        NSLog(@"创建手势密码");
        
        LCYGesturePassWordViewController *vc = [[LCYGesturePassWordViewController alloc] initWithUnlockType:LCYUnlockTypeCreatePsw];
        [self presentViewController:vc animated:YES completion:nil];
    } else if (indexPath.row == 1) { // 校验手势密码
        NSLog(@"校验手势密码");
        
        if ([LCYGesturePassWordViewController gesturesPassword].length > 0) {
            
            LCYGesturePassWordViewController *vc = [[LCYGesturePassWordViewController alloc] initWithUnlockType:LCYUnlockTypeValidatePsw];
            [self presentViewController:vc animated:YES completion:nil];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"还没有设置手势密码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [alertView show];
        }
    } else if (indexPath.row == 2) { // 删除手势密码
        NSLog(@"删除手势密码");

        [LCYGesturePassWordViewController deleteGesturesPassword];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
