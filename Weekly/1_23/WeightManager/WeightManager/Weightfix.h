//
//  Weightfix.h
//  WeightManager
//
//  Created by Chie AHAREN on 2013/12/04.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Weightfix : UIViewController{
    IBOutlet UILabel *label;
    IBOutlet UILabel *label2;
    //引き渡し準備
    NSDate *date;
    //数字入力
    NSDateFormatter *df;
    int count;
	BOOL startInput;
    BOOL Input;

}
@property(nonatomic,retain) NSString *strText; // 受け取りプロパティ
- (IBAction)button:(id)sender;
- (IBAction)clearButton:(id)sender;
- (IBAction)enter:(id)sender;

@end
