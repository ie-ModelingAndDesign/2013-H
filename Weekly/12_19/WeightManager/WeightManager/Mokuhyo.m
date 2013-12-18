//
//  目標入力
//  Mokuhyo.m
//  WeightManager
//
//  Created by e125740 on 2013/12/01.
//  Copyright (c) 2013年 Yukiya IHA. All rights reserved.
//

#import "Mokuhyo.h"

@interface Mokuhyo ()

@end

@implementation Mokuhyo

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
    //startInputにyesを代入する
    startInput = YES;
    //Weightにyesを代入する
    Input = YES;
    //countを初期化する。
    count = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//数字の入力
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
- (IBAction)clearbutton:(id)sender {
    label.text = @"0";
    startInput = YES;
    Input = YES;
    count = 0;

}

//データの保存をする
- (IBAction)enter:(id)sender {
    
    /*データの保存(保存するもの:save,インデックス:Mokuhyo)*/
    NSString *save = label.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:save forKey:@"Mokuhyo"];
    
    //成功時出力
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }

}
@end
