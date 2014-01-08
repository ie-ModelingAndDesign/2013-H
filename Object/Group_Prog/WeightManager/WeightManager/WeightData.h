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
    IBOutlet UILabel *weight1;
    IBOutlet UILabel *weight2;
}
- (IBAction)date1:(id)sender;
- (IBAction)date2:(id)sender;


- (void)CallMethod;

@end
