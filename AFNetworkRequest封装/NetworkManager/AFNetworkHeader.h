//
//  AFNetworkHeader.h
//  AFNetworkRequest封装
//
//  Created by beautysite on 16/10/21.
//  Copyright © 2016年 beautysite. All rights reserved.
//

#ifndef AFNetworkHeader_h
#define AFNetworkHeader_h

#ifdef DEBUG
#   define DTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DTLog(...)
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];


#import "YWAFNetworkDefine.h"
#import "AFNetworkHandler.h"
#import "AFNetworkManamger.h"
#import "AFNetworkItem.h"
#import "MBProgressHUD+Add.h"
#import "AFNetworking.h"

#endif /* AFNetworkHeader_h */
