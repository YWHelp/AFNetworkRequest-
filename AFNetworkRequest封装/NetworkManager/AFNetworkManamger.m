//
//  YWNetworkManamger.m
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#import "AFNetworkManamger.h"
//#import "AFNetworkHeader.h"
@implementation AFNetworkManamger


static AFNetworkManamger *_manager;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static AFNetworkManamger *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}
/// 返回单例
+(instancetype)sharedInstance
{
    return [[super alloc] init];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return _manager;
}

#pragma mark - GET 请求回调方法

/**
 *   GET请求的公共方法 一下三种方法都调用这个方法 根据传入的不同参数觉得回调的方式
 *
 *   @param url           ur
 *   @param paramsDict   paramsDict
 *   @param target       target
 *   @param action       action
 *   @param delegate     delegate
 *   @param loadingBlock loadingBlock
 *   @param successBlock successBlock
 *   @param failureBlock failureBlock
 *   @param showHUD      showHUD
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
                  target:(id)target
                  action:(SEL)action
                delegate:(id)delegate
         loadingProgress:(AFLoadingProgressBlock)loadingBlock
            successBlock:(AFRequestSuccessBlock)successBlock
            failureBlock:(AFRequestFailureBlock)failureBlock
                 showHUD:(BOOL)showHUD
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:paramsDict];
    
    [[AFNetworkHandler sharedInstance] conURL:url networkType:AFNetWorkGET params:mutableDict delegate:delegate showHUD:showHUD target:target action:action loadingProgress:loadingBlock successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - POST请求的回调方法
/**
 *   发送一个 POST请求的公共方法 传入不同的回调参数决定回调的方式
 *
 *   @param url           ur
 *   @param params       params
 *   @param target       target
 *   @param action       action
 *   @param delegate     delegate
 *   @param loadingBlock loadingBlock
 *   @param successBlock successBlock
 *   @param failureBlock failureBlock
 *   @param showHUD      showHUD
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)params
                    target:(id)target
                    action:(SEL)action
                  delegate:(id<AFNetworkItemDelegate>)delegate
           loadingProgress:(AFLoadingProgressBlock)loadingBlock
              successBlock:(AFRequestSuccessBlock)successBlock
              failureBlock:(AFRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [[AFNetworkHandler sharedInstance] conURL:url networkType:AFNetWorkGET params:mutableDict delegate:delegate showHUD:showHUD target:target action:action loadingProgress:loadingBlock successBlock:successBlock failureBlock:failureBlock];
}
#pragma mark - 上传文件 -
/**
 *  上传文件
 *
 *  @param url          上传文件的 url 地址
 *  @param paramsDict   参数字典
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *  @param showHUD      显示 HUD
 */
+ (void)uploadFileWithURL:(NSString*)url
                   params:(NSDictionary*)paramsDict
          loadingProgress:(AFLoadingProgressBlock)loadingBlock
             successBlock:(AFRequestSuccessBlock)successBlock
             failureBlock:(AFRequestFailureBlock)failureBlock
              uploadParam:(AFUploadParam *)uploadParam
                  showHUD:(BOOL)showHUD
{
    if (showHUD) {
        
        [MBProgressHUD showHUDAddedTo:nil animated:YES];
    }
    DTLog(@"上传图片接口 URL-> %@",url);
    DTLog(@"上传图片的参数-> %@",paramsDict);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:paramsDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
     [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        loadingBlock(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBProgressHUD hideHUDForView:nil animated:YES];
        DTLog(@"----> %@",responseObject);
        if (successBlock) {
            successBlock(YES,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideAllHUDsForView:nil animated:YES];
        DTLog(@"----> %@",error.domain);
        if (error) {
            failureBlock(NO,@"上传失败",error);
        }
    }];
}

@end
