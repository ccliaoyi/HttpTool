//
//  AFHTTPSessionManager+NetworkManager.m
//  机构APP
//
//  Created by fits on 16/12/1.
//  Copyright © 2016年 fits. All rights reserved.
//

#import "AFHTTPSessionManager+NetworkManager.h"

@implementation AFHTTPSessionManager (NetworkManager)

static AFHTTPSessionManager *manager;

+(AFHTTPSessionManager *)sharedHttpSessionManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    return manager;
}

@end
