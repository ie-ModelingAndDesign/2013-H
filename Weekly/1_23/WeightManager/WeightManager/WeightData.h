//
//  WeightData.h
//  WeightManager
//
//  Created by Chie AHAREN on 2013/12/04.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightData : UIViewController{
    NSDateFormatter *df;
    IBOutlet UILabel *date1;
    IBOutlet UILabel *date2;
    IBOutlet UILabel *date3;
    IBOutlet UILabel *date4;
    IBOutlet UILabel *date5;
    IBOutlet UILabel *date6;
    IBOutlet UILabel *date7;
    IBOutlet UILabel *weight1;
    IBOutlet UILabel *weight2;
    IBOutlet UILabel *weight3;
    IBOutlet UILabel *weight4;
    IBOutlet UILabel *weight5;
    IBOutlet UILabel *weight6;
    IBOutlet UILabel *weight7;
}
- (IBAction)date1:(id)sender;
- (IBAction)date2:(id)sender;
- (IBAction)date3:(id)sender;
- (IBAction)date4:(id)sender;
- (IBAction)date5:(id)sender;
- (IBAction)date6:(id)sender;
- (IBAction)date7:(id)sender;

- (void)CallMethod;

@end
