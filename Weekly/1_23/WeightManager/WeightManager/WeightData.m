//
//  WeightData.m
//  WeightManager
//
//  Created by Chie AHAREN on 2013/12/04.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import "WeightData.h"
#import "AppDelegate.h" // 追加

@interface WeightData ()

@end

@implementation WeightData

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // NsDate => NSString変換用のフォーマットを作成
    df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定

    /*日付の表示*/
    [df setDateFormat:@"MM月dd日"];
    
    //now
    NSDate *day1 = [NSDate dateWithTimeIntervalSinceNow:0*24*60*60];
    NSString *sday1 = [df stringFromDate:day1];
    date1.text =[NSString stringWithFormat:@"%@",sday1 ];
    
    //yestaday
    NSDate *day2 = [NSDate dateWithTimeIntervalSinceNow:-1*24*60*60];
    NSString *sday2 = [df stringFromDate:day2];
    date2.text =[NSString stringWithFormat:@"%@",sday2 ];
    
    NSDate *day3 = [NSDate dateWithTimeIntervalSinceNow:-2*24*60*60];
    NSString *sday3 = [df stringFromDate:day3];
    date3.text =[NSString stringWithFormat:@"%@",sday3 ];

    NSDate *day4 = [NSDate dateWithTimeIntervalSinceNow:-3*24*60*60];
    NSString *sday4 = [df stringFromDate:day4];
    date4.text =[NSString stringWithFormat:@"%@",sday4 ];

    NSDate *day5 = [NSDate dateWithTimeIntervalSinceNow:-4*24*60*60];
    NSString *sday5 = [df stringFromDate:day5];
    date5.text =[NSString stringWithFormat:@"%@",sday5 ];

    NSDate *day6 = [NSDate dateWithTimeIntervalSinceNow:-5*24*60*60];
    NSString *sday6 = [df stringFromDate:day6];
    date6.text =[NSString stringWithFormat:@"%@",sday6 ];

    NSDate *day7= [NSDate dateWithTimeIntervalSinceNow:-6*24*60*60];
    NSString *sday7 = [df stringFromDate:day7];
    date7.text =[NSString stringWithFormat:@"%@",sday7 ];

    /*体重表示*/
   [df setDateFormat:@"yyyyMMdd"];
    
    //one week
    /*データの取り出し(取り出したデータ保存先:save,インデックス:strNow)*/
    sday1 = [df stringFromDate:day1];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *save = [defaults stringForKey:sday1];
    //取り出したデータを表示
    weight1.text = [NSString stringWithFormat:@"%@", save];
    
    
    /*データの取り出し(取り出したデータ保存先:save,インデックス:strNow)*/
    sday2 = [df stringFromDate:day2];
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *save2 = [defaults1 stringForKey:sday2];
    //取り出したデータを表示
    weight2.text = [NSString stringWithFormat:@"%@", save2];
    
    sday3 = [df stringFromDate:day3];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *save3 = [defaults2 stringForKey:sday3];
    //取り出したデータを表示
    weight3.text = [NSString stringWithFormat:@"%@", save3];
    
    sday4 = [df stringFromDate:day4];
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    NSString *save4 = [defaults3 stringForKey:sday4];
    //取り出したデータを表示
    weight4.text = [NSString stringWithFormat:@"%@", save4];
    
    sday5 = [df stringFromDate:day5];
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    NSString *save5 = [defaults4 stringForKey:sday5];
    //取り出したデータを表示
    weight5.text = [NSString stringWithFormat:@"%@", save5];
    
    sday6 = [df stringFromDate:day6];
    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    NSString *save6 = [defaults5 stringForKey:sday6];
    //取り出したデータを表示
    weight6.text = [NSString stringWithFormat:@"%@", save6];

    sday7 = [df stringFromDate:day7];
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    NSString *save7 = [defaults6 stringForKey:sday7];
    //取り出したデータを表示
    weight7.text = [NSString stringWithFormat:@"%@", save7];



}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSString *DateCount = @"null";

// これを呼び出してみる
- (void)CallMethod
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    appDelegate.DateAccess =[NSString stringWithFormat:@"%@", DateCount];
}

- (IBAction)date1:(id)sender {
    DateCount = @"0";
}

- (IBAction)date2:(id)sender {
    DateCount = @"1";
}

- (IBAction)date3:(id)sender {
    DateCount = @"2";
}

- (IBAction)date4:(id)sender {
    DateCount = @"3";
}

- (IBAction)date5:(id)sender {
    DateCount = @"4";
}

- (IBAction)date6:(id)sender {
    DateCount = @"5";
}

- (IBAction)date7:(id)sender {
    DateCount = @"6";
}
@end
