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
    
    
    /*体重表示*/
   [df setDateFormat:@"yyyyMMdd"];
    
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

@end
