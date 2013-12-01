//
//  ViewController.m
//  test
//
//  Created by Yume OOHAMA on 2013/11/24.
//  Copyright (c) 2013年 Yume OOHAMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//appを起動した際に行う作業
- (void)viewDidLoad
{
    [super viewDidLoad];
    //startInputにyesを代入する
    startInput = YES;
    //Weightにyesを代入する
    Input = YES;
    //countを初期化する。
    count = 0;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    
    UIButton *b = (UIButton *)sender;

	//1回目の入力
	if(startInput){
        //少数点ボタンが押された時
        if( b.tag == 10){
            label.text = [NSString stringWithFormat:@"0."];
        //新しく表示する文字列を作成
        }else{
            label.text = [NSString stringWithFormat:@"%d", b.tag];
        }
		startInput =  NO;
   //1回目以降の入力
	} else {
        //少数点ボタンが押された時
        if( b.tag == 10){
            NSRange searchResult = [label.text rangeOfString:@"."];
            if(searchResult.location == NSNotFound){
                label.text =[NSString stringWithFormat:@"%@%@",label.text,@"."];
                
                //countの初期化
                count = 0;
                //3桁以上の小数入力対策
                Input = YES;
            }
            
        }else{
            if(Input){
                
                //すでに表示している文字列に連結する
                label.text = [NSString stringWithFormat:@"%@%d", label.text, b.tag];
            
            //3回(2回+startInput)までの入力を許可
            count++;
            if(count == 2){
                Input = NO;
            }
                 
            }
        }
    
    }
}

//表示している文字列をクリアする
- (IBAction)clearButton:(id)sender {
    label.text = @"0";
    startInput = YES;
    Input = YES;
    count = 0;
}

- (IBAction)enter:(id)sender {
    
    /*日付を使うための準備*/
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    [df setDateFormat:@"yyyyMMdd"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    /*データの保存(保存するもの:save,インデックス:strNow)*/
    NSString *save = label.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:save forKey:strNow];
    
    //成功時出力
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
}

- (IBAction)result:(id)sender {
    
    /*日付を使うための準備*/
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    [df setDateFormat:@"yyyyMMdd"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    //NSDate *now = [NSDate date];
    //NSString *strNow = [df stringFromDate:now];
    
    /*データの取り出し(取り出したデータ保存先:save,インデックス:strNow)*/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *save = [defaults stringForKey:@"20131130"];
    //取り出したデータを保存
    label2.text = [NSString stringWithFormat:@"%@", save];
    
}

@end
