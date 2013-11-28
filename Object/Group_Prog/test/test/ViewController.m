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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    
    UIButton *b = (UIButton *)sender;
	
	if( startInput ){
		// 最初の1桁目が0なら表示しない
		if( b.tag == 0 ) return;
        if( b.tag == 10){
            self.label.text = [NSString stringWithFormat:@"0."];
        }else{
            // 新しく表示する文字列を作成
            self.label.text = [NSString stringWithFormat:@"%d", b.tag];
            
        }
		startInput =  NO;
	} else {
        if( b.tag == 10){
            NSRange searchResult = [self.label.text rangeOfString:@"."];
            if(searchResult.location == NSNotFound){
                self.label.text =[NSString stringWithFormat:@"%@%@",self.label.text,@"."];
            }
        }else{
		// すでに表示されている文字列に連結
		self.label.text = [NSString stringWithFormat:@"%@%d", self.label.text, b.tag];
        }
    
    }
}


- (IBAction)clearButton:(id)sender {
    self.label.text = @"0";
    startInput = YES;
}

- (IBAction)enter:(id)sender {
    
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    [df setDateFormat:@"yyyyMMdd"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    NSString *save = self.label.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:save forKey:strNow];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }

    
//    self.label2.text = self.label.text;
}

- (IBAction)result:(id)sender {
    
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    [df setDateFormat:@"yyyyMMdd"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *save = [defaults stringForKey:strNow];

            self.label2.text = [NSString stringWithFormat:@"%@", save];
    
      //  NSLog(@"%@", @"データが存在しません。");
    
}

@end
