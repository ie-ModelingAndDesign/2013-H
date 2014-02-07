//
//  目標入力
//  Mokuhyo.h
//  WeightManager
//
//  Created by e125740 on 2013/12/01.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mokuhyo : UIViewController{
    IBOutlet UILabel *label;
    int count;
	BOOL startInput;
    BOOL Input;
    int goal;//増量減量の分岐に使用
}
- (IBAction)button:(id)sender;
- (IBAction)clearbutton:(id)sender;
- (IBAction)enter:(id)sender;
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
@end
