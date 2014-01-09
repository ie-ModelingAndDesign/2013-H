//
//  BarAndScatterViewController.h
//  WeightManager
//
//  Created by Chie AHAREN on 2014/01/09.
//  Copyright (c) 2014年 Yukiya IHA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

// 折れ線グラフ用のデータソース(CPTPlotDataSource)を記載。CPTScatterPlotDataSourceと間違えないように注意
@interface BarAndScatterViewController : UIViewController
<CPTPlotDataSource>
{
@private
    // グラフ表示領域（この領域に円グラフを追加する）
    CPTGraph *graph;

    __weak IBOutlet UILabel *label;
}

// 円グラフで表示するデータを保持する配列
@property (readwrite, nonatomic) NSMutableArray *scatterPlotData;
@property (readwrite, nonatomic) NSMutableArray *Mokuhyo;

@end
