//
//  YWAFNetworkDefine.h
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifndef YWAFNetworkDefine_h
#define YWAFNetworkDefine_h

/**
 *  请求类型
 */
typedef enum {
    AFNetWorkGET = 1,   /**< GET请求 */
    AFNetWorkPOST       /**< POST请求 */
} AFNetWorkRequestType;

/**
 *  网络请求超时的时间
 */
#define AFRequest_API_TIME_OUT 20

/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^AFRequestStartBlock)(void);

/**
 *  上传/下载进度
 */
typedef void (^AFLoadingProgressBlock)(NSProgress * _Nonnull loadingProgress);

/**
 *  请求成功回调
 *
 *  @param responseObject 回调block
 */
typedef void (^AFRequestSuccessBlock)(BOOL isSuccess ,id  _Nonnull  responseObject);
/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^AFRequestFailureBlock)(BOOL isSuccess,NSString *  _Nonnull msg, NSError *  _Nonnull error);


#endif /* YWAFNetworkDefine_h */
