//
//  User.h
//  2-JavaScriptCore
//
//  Created by FlyElephant on 2017/6/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UserExportProtocol <JSExport>

- (void)buy:(NSString *)name;

@end


@interface User : NSObject<UserExportProtocol>

@end
