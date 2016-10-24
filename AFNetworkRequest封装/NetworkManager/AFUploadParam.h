//
//  AFUploadParam.h
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFUploadParam : NSObject
/**
 *  上传文件的二进制数据
 */
@property (nonatomic, strong) NSData *data;
/**
 *  上传的参数名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  上传到服务器的文件名称
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  上传文件的类型
 */
@property (nonatomic, copy) NSString *mimeType;
@end
