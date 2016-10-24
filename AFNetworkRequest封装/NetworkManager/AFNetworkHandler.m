//
//  AFNetworkHandler.m
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//


#import "AFNetworkHeader.h"
#import "AFNetworking.h"
@implementation AFNetworkHandler

+ (AFNetworkHandler *)sharedInstance
{
    static AFNetworkHandler *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[AFNetworkHandler alloc] init];
    });
    return handler;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.networkError = NO;
    }
    return self;
}

#pragma mark - 创建一个网络请求项
/**
 *  创建一个网络请求项
 *
 *  @param url          网络请求URL
 *  @param networkType  网络请求方式
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param loadingBlock 请求进度
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (AFNetworkItem*)conURL:(NSString *)url
             networkType:(AFNetWorkRequestType)networkType
                  params:(NSMutableDictionary *)params
                delegate:(id)delegate
                 showHUD:(BOOL)showHUD
                  target:(id)target
                  action:(SEL)action
         loadingProgress:(AFLoadingProgressBlock)loadingBlock
            successBlock:(AFRequestSuccessBlock)successBlock
            failureBlock:(AFRequestFailureBlock)failureBlock
{
    if (self.networkError == YES) {
        SHOW_ALERT(@"网络连接断开,请检查网络!");
        if (failureBlock) {
            failureBlock(NO,nil,nil);
        }
        return nil;
    }
    /// 如果有一些公共处理，可以写在这里
    NSUInteger hashValue = [delegate hash];
    self.netWorkItem = [[AFNetworkItem alloc]initWithtype:networkType url:url params:params delegate:delegate target:target action:action hashValue:hashValue showHUD:showHUD loadingProgress:loadingBlock successBlock:successBlock failureBlock:failureBlock];
   // self.netWorkItem.delegate = self;
    [self.items addObject:self.netWorkItem];
    return self.netWorkItem;
}

#pragma makr - 开始监听网络连接

+ (void)startMonitoring
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                DTLog(@"未知网络");
                [AFNetworkHandler sharedInstance].networkError = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                [AFNetworkHandler sharedInstance].networkError = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                DTLog(@"手机自带网络");
                [AFNetworkHandler sharedInstance].networkError = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                DTLog(@"WIFI");
                [AFNetworkHandler sharedInstance].networkError = NO;
                break;
        }
    }];
    [mgr startMonitoring];
}
/**
 *   懒加载网络请求项的 items 数组
 *
 *   @return 返回一个数组
 */
- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
/**
 *   取消所有正在执行的网络请求项
 */
+ (void)cancelAllNetItems
{
    AFNetworkHandler *handler = [AFNetworkHandler sharedInstance];
    [handler.items removeAllObjects];
    handler.netWorkItem = nil;
}

- (void)netWorkWillDealloc:(AFNetworkItem *)itme
{
    [self.items removeObject:itme];
    self.netWorkItem = nil;
}


@end
