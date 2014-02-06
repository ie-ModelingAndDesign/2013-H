//
//  AppDelegate.h
//  WeightManager
//
//  Created by CR7 on 2014/01/23.
//  Copyright (c) 2014年 syuhei miyagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
    
@property (strong, nonatomic) UIWindow *window;
    
// ここに受け渡ししたい変数を宣言
@property (nonatomic,retain) NSString *DateAccess;
    
@end
