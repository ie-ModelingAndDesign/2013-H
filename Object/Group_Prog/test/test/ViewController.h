//
//  ViewController.h
//  test
//
//  Created by Yume OOHAMA on 2013/11/24.
//  Copyright (c) 2013年 Yume OOHAMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *label;
    IBOutlet UILabel *label2;
    int count;
	BOOL startInput;
    BOOL Input;

}

- (IBAction)button:(id)sender;
- (IBAction)clearButton:(id)sender;
- (IBAction)enter:(id)sender;
- (IBAction)result:(id)sender;

@end
