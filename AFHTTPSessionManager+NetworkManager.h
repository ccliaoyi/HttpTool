//
//  AFHTTPSessionManager+NetworkManager.h
//  机构APP
//
//  Created by fits on 16/12/1.
//  Copyright © 2016年 fits. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (NetworkManager)

//创建单例对象 AFHTTPSessionManager
+(AFHTTPSessionManager *)sharedHttpSessionManager;

@end
