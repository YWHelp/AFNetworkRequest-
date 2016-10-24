//
//  ViewController.m
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworkManamger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [AFNetworkManamger  getRequstWithURL:nil  params:nil target:nil action:nil delegate:nil loadingProgress:^(NSProgress * _Nonnull loadingProgress) {
        
        
    } successBlock:^(BOOL isSuccess, id  _Nonnull responseObject) {
       
        
        
    } failureBlock:^(BOOL isSuccess, NSString * _Nonnull msg, NSError * _Nonnull error) {
     
        
        
    } showHUD:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
