//
//  WeightData.m
//  WeightManager
//
//  Created by Chie AHAREN on 2013/12/04.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import "WeightData.h"

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
    
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    [df setDateFormat:@"yyyyMMdd"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    /*データの取り出し(取り出したデータ保存先:save,インデックス:strNow)*/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *save = [defaults stringForKey:strNow];
    //取り出したデータを保存
    label1.text = [NSString stringWithFormat:@"%@", save];
    
    
    /*データの取り出し(取り出したデータ保存先:save,インデックス:strNow)*/
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *mokuhyou = [defaults1 stringForKey:@"Mokuhyo"];
    //取り出したデータを保存
    label2.text = [NSString stringWithFormat:@"%@", mokuhyou];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
