//
//  YWNetworkManamger.h
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkHeader.h"
#import "AFUploadParam.h"
@interface AFNetworkManamger : NSObject
/// 返回单例
+(instancetype)sharedInstance;

/**
 *   GET请求的公共方法 一根据传入的不同参数觉得回调的方式
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
                 showHUD:(BOOL)showHUD;


/**
 *   发送一个 POST请求的公共方法 一 根据传入不同的回调参数决定回调的方式
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
                  delegate:(id)delegate
           loadingProgress:(AFLoadingProgressBlock)loadingBlock
              successBlock:(AFRequestSuccessBlock)successBlock
              failureBlock:(AFRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD;

/**
 *  上传文件
 *
 *  @param url          上传文件的 url 地址
 *  @param paramsDict   参数字典
 *  @param loadingBlock 上传进度
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
                  showHUD:(BOOL)showHUD;

@end
