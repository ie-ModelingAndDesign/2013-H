//
//  ViewController.h
//  graf
//
//  Created by Chie AHAREN on 2014/01/09.
//  Copyright (c) 2014年 Chie AHAREN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface ViewController : UIViewController
<CPTPlotDataSource>
{
@private
    // グラフ表示領域（この領域に棒グラフを追加する）
    CPTGraph *graph;
}

// 表示するデータを保持する配列
@property(nonatomic, strong) NSMutableArray *dataForBar;        // 棒グラフ用
@property(nonatomic, strong) NSMutableArray *dataForScatter;    // 折れ線グラフ用

@end


