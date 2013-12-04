//
//　今日の体重
//  WeightInput.h
//  WeightManager
//
//  Created by Chie AHAREN on 2013/12/04.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightInput : UIViewController{
    IBOutlet UILabel *label;
    int count;
	BOOL startInput;
    BOOL Input;
}
- (IBAction)button:(id)sender;
- (IBAction)clearButton:(id)sender;
- (IBAction)enter:(id)sender;

@end
