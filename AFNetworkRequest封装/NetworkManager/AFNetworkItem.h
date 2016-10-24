//
//  AFNetworkItem.h
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkHeader.h"

@class AFNetworkItem;

@protocol AFNetworkItemDelegate <NSObject>

@optional

/**
 *   请求结束
 *
 *   @param returnData 返回的数据
 */
- (void)requestDidFinishLoading:(NSDictionary*)returnData;
/**
 *   请求失败
 *
 *   @param error 失败的 error
 */
- (void)requestdidFailWithError:(NSError*)error;

/**
 *   网络请求项即将被移除掉
 *
 *   @param itme 网络请求项
 */
- (void)netWorkWillDealloc:(AFNetworkItem*)itme;

@end


/**
 *  网络请求子项
 */
@interface AFNetworkItem : NSObject

/**
 *  网络请求方式
 */
@property (nonatomic, assign) AFNetWorkRequestType networkType;

/**
 *  网络请求URL
 */
@property (nonatomic, strong) NSString *url;

/**
 *  网络请求参数
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 *  网络请求的委托
 */
@property (nonatomic, assign) id<AFNetworkItemDelegate>delegate;
/**
 *   target
 */
@property (nonatomic,assign) id tagrget;
/**
 *   action
 */
@property (nonatomic,assign) SEL select;

/**
 *  是否显示HUD
 */
@property (nonatomic, assign) BOOL showHUD;

#pragma mark - 创建一个网络请求项，开始请求网络
/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param loadingBlock 加载进度
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return MHAsiNetworkItem对象
 */
- (AFNetworkItem *)initWithtype:(AFNetWorkRequestType)networkType
                            url:(NSString *)url
                         params:(NSDictionary *)params
                       delegate:(id)delegate
                         target:(id)target
                         action:(SEL)action
                      hashValue:(NSUInteger)hashValue
                        showHUD:(BOOL)showHUD
                loadingProgress:(AFLoadingProgressBlock)loadingBlock
                   successBlock:(AFRequestSuccessBlock)successBlock
                   failureBlock:(AFRequestFailureBlock)failureBlock;

@end

