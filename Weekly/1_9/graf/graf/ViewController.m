//
//  ViewController.m
//  graf
//
//  Created by Chie AHAREN on 2014/01/09.
//  Copyright (c) 2014年 Chie AHAREN. All rights reserved.
//

// バーを識別するための識別文字列
#define IDENTIFIER_BAR_PLOT     @"Bar Plot"     // 棒グラフ用
#define IDENTIFIER_SCATTER_PLOT @"Scatter Plot" // 折れ線グラフ用

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // -----------------------------------------
    // グラフに表示するデータを生成
    // -----------------------------------------
    // 棒グラフ用のデータ。12ヶ月の棒グラフのX軸データ。X軸に1〜10のデータを10個宣言。
    self.dataForBar = [NSMutableArray arrayWithObjects:
                       [NSNumber numberWithDouble:1.0],[NSNumber numberWithDouble:2.0],
                       [NSNumber numberWithDouble:3.0],[NSNumber numberWithDouble:4.0],
                       [NSNumber numberWithDouble:5.0],[NSNumber numberWithDouble:6.0],
                       [NSNumber numberWithDouble:7.0],[NSNumber numberWithDouble:8.0],
                       [NSNumber numberWithDouble:9.0],[NSNumber numberWithDouble:10.0],
                       nil];
    
    // 折れ線グラフ用のデータ。X軸とY軸の両方を設定する必要がある。キーを設定し、次のようなデータ構造になっている
    self.dataForScatter = [NSMutableArray array];
    for ( NSUInteger i = 0; i < 11; i++ ) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        NSNumber *y = [NSNumber numberWithDouble:(int)(rand() / (double)RAND_MAX * 100)]; // 1〜100の値のランダム値(int)
        [self.dataForScatter addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
    }
    
    // -----------------------------------------
    // グラフの基本的な設定
    // -----------------------------------------
    // ホスティングビューを生成
    CPTGraphHostingView *hostingView =
    [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    // 画面にホスティングビューを追加
    [self.view addSubview:hostingView];
    
    // グラフを生成
    graph = [[CPTXYGraph alloc] initWithFrame:hostingView.bounds];
    hostingView.hostedGraph = graph;
    
    // グラフのボーダー設定
    graph.plotAreaFrame.borderLineStyle = nil;
    graph.plotAreaFrame.cornerRadius    = 0.0f;
    graph.plotAreaFrame.masksToBorder   = NO;
    
    // パディング
    graph.paddingLeft   = 0.0f;
    graph.paddingRight  = 0.0f;
    graph.paddingTop    = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.plotAreaFrame.paddingLeft   = 50.0f;
    graph.plotAreaFrame.paddingTop    = 60.0f;
    graph.plotAreaFrame.paddingRight  = 50.0f;
    graph.plotAreaFrame.paddingBottom = 65.0f;
    
    
    // -----------------------------------------
    // プロットスペース(グラフを記載するスペース)
    // -----------------------------------------
    //デフォルトのプロット間隔の設定。棒グラフを表示させる。
    CPTXYPlotSpace *defaultPlotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    //X軸は0〜10の値で設定
    defaultPlotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(10)];
    //Y軸は0〜10の値で設定
    defaultPlotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(10)];
    
    // 折れ線グラフ用のプロットスペース
	CPTXYPlotSpace *scatterPlotSpace = [[CPTXYPlotSpace alloc] init];
    //X軸は0〜10の値で設定
	scatterPlotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromUnsignedInteger(0) length:CPTDecimalFromUnsignedInteger(10)];
    //Y軸は0〜100の値で設定
	scatterPlotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(0) length:CPTDecimalFromInteger(100)];
    // グラフに折れ線グラフ用のプロットスペースを設定する
	[graph addPlotSpace:scatterPlotSpace];
    
    
    // -----------------------------------------
    // スタイルの宣言(あとからグラフのメモリやグラフ自体に設定する)
    // -----------------------------------------
    // テキストスタイル
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.color                = [CPTColor colorWithComponentRed:0.447f green:0.443f blue:0.443f alpha:1.0f];
    textStyle.fontSize             = 11.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    
    // ラインスタイル
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0.788f green:0.792f blue:0.792f alpha:1.0f];
    lineStyle.lineWidth            = 2.0f;
    
    // 折れ線グラフ用のラインスタイル
    CPTMutableLineStyle *lineStyleForScatter = [CPTMutableLineStyle lineStyle];
    lineStyleForScatter.lineColor  = [CPTColor colorWithComponentRed:0.780f green:0.50f blue:0.531f alpha:0.50f];
    lineStyleForScatter.lineWidth  = 2.0f;
    
    // -----------------------------------------
    // X軸とY軸のメモリ・ラベルなどの設定
    // -----------------------------------------
    // X軸のメモリ・ラベルなどの設定
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    CPTXYAxis *x          = axisSet.xAxis;
    x.axisLineStyle               = lineStyle;      // X軸の線にラインスタイルを適用
    x.majorTickLineStyle          = lineStyle;      // X軸の大きいメモリにラインスタイルを適用
    x.minorTickLineStyle          = lineStyle;      // X軸の小さいメモリにラインスタイルを適用
    x.majorIntervalLength         = CPTDecimalFromString(@"2"); // X軸ラベルの表示間隔
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0"); // X軸のY位置
    x.title                       = @"共通のX軸";    // X軸のタイトル
    x.titleTextStyle = textStyle;                   // X軸のテキストスタイルの設定
    x.titleLocation               = CPTDecimalFromFloat(5.0f);
    x.titleOffset                 = 30.0f;
    x.minorTickLength = 5.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    x.majorTickLength = 9.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    x.labelTextStyle = textStyle;
    
    // Y軸のメモリ・ラベルなどの設定
    CPTXYAxis *y = axisSet.yAxis;
    y.axisLineStyle               = lineStyle;      // Y軸の線にラインスタイルを適用
    y.majorTickLineStyle          = lineStyle;      // Y軸の大きいメモリにラインスタイルを適用
    y.minorTickLineStyle          = lineStyle;      // Y軸の小さいメモリにラインスタイルを適用
    y.majorTickLength = 9.0f;                   // Y軸の大きいメモリの長さ
    y.minorTickLength = 5.0f;                   // Y軸の小さいメモリの長さ
    y.majorIntervalLength         = CPTDecimalFromFloat(1.0f);  // Y軸ラベルの表示間隔
    y.orthogonalCoordinateDecimal = CPTDecimalFromFloat(0.0f);  // Y軸のX位置
    y.title                       = @"棒グラフY軸";   // Y軸のタイトル
    y.titleTextStyle = textStyle;                   // Y軸のテキストスタイルの設定
    y.titleRotation = M_PI * 2;
    y.titleLocation               = CPTDecimalFromFloat(11.0f);
    y.titleOffset                 = -20.0f;
    lineStyle.lineWidth = 0.5f;
    y.majorGridLineStyle = lineStyle;
    y.labelTextStyle = textStyle;
    
	// 折れ線グラフ用のY軸の設定
    CPTXYAxis *scatterY = [[CPTXYAxis alloc] init];
    scatterY.plotSpace = scatterPlotSpace;      // 折れ線グラフ用のプロットスペースを設定
	scatterY.coordinate = CPTCoordinateY;       // 軸をY軸に設定
    scatterY.labelOffset = -40.0f;              // ラベルの表示位置をオフセット値で設定
    scatterY.axisLineStyle               = lineStyleForScatter;      // Y軸の線にラインスタイルを適用
    scatterY.majorTickLineStyle          = lineStyleForScatter;      // Y軸の大きいメモリにラインスタイルを適用
    scatterY.minorTickLineStyle          = lineStyleForScatter;      // Y軸の小さいメモリにラインスタイルを適用
    scatterY.majorTickLength = 9.0f;                   // Y軸の大きいメモリの長さ
    scatterY.minorTickLength = 5.0f;                   // Y軸の小さいメモリの長さ
    scatterY.majorIntervalLength         = CPTDecimalFromFloat(10.0f);  // Y軸ラベルの表示間隔
    scatterY.orthogonalCoordinateDecimal = CPTDecimalFromFloat(10.0f);  // Y軸のX位置
    scatterY.title                       = @"折れ線グラフY軸";   // 折れ線グラフ用のY軸のタイトル
    scatterY.titleTextStyle = textStyle;                       // 折れ線グラフ用のY軸のテキストスタイルの設定
    scatterY.titleRotation = M_PI * 2;
    scatterY.titleLocation               = CPTDecimalFromFloat(110.0f);
    scatterY.titleOffset                 = -25.0f;
    
    // Axis配列をGraphに登録
	graph.axisSet.axes = [NSArray arrayWithObjects:x, y, scatterY, nil];
    
    
    // -----------------------------------------
    // 棒グラフの作成と設定
    // -----------------------------------------
    // 棒グラフの作成
    // horizontalBars:BOOL => YESの場合、横棒グラフ。NOの場合、縦棒グラフ。
    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor colorWithComponentRed:1.0f green:1.0f blue:0.88f alpha:1.0f] horizontalBars:NO];
    barPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.573f green:0.82f blue:0.831f alpha:0.50f]]; // バーの色を設定。上記のカラーが上塗りされる。
    barPlot.identifier = IDENTIFIER_BAR_PLOT;           // 棒グラフの識別子を設定
    barPlot.lineStyle = lineStyle;                      // ラインスタイルを設定
    barPlot.baseValue  = CPTDecimalFromString(@"0");    // グラフのベースの値を設定
    barPlot.dataSource = self;                          // データソースを設定
    barPlot.delegate = self;
    barPlot.barWidth = CPTDecimalFromFloat(0.3f);       // 各棒の幅を設定
    barPlot.barOffset  = CPTDecimalFromFloat(0.2f);     // 各棒の横軸からのオフセット値を設定
    [graph addPlot:barPlot toPlotSpace:defaultPlotSpace];   // 棒グラフ用プロットスペースに棒グラフを追加
    
    // -----------------------------------------
    // 折れ線グラフの作成と設定
    // -----------------------------------------
    // 折れ線グラフのインスタンスを生成
    CPTScatterPlot *scatterPlot = [[CPTScatterPlot alloc] init];
    scatterPlot.identifier      = IDENTIFIER_SCATTER_PLOT;      // 折れ線グラフを識別するために識別子を設定
    scatterPlot.dataSource      = self;                         // 折れ線グラフのデータソースを設定
    scatterPlot.dataLineStyle = lineStyleForScatter;            // スタイルを設定
    [graph addPlot:scatterPlot toPlotSpace:scatterPlotSpace];   // 折れ線グラフ用プロットスペースに折れ線グラフを追加
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Plot Data Source Methods

// プロットするためのレコード数を返す(通常はX軸の数を返す)
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    // 棒グラフの場合
    if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
        return [self.dataForBar count];
    } // 折れ線グラフの場合
    else if ( [plot isKindOfClass:[CPTScatterPlot class]] ) {
        return [self.dataForScatter count];
    }
    return 0;
}

// プロットするデータを返す(X軸とY軸を返す)
-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSDecimalNumber *num = nil;
    
    // 棒グラフの場合
    if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
        if ([plot.identifier isEqual:IDENTIFIER_BAR_PLOT]) {
            switch ( fieldEnum ) {
                    //X軸のラベル
                case CPTBarPlotFieldBarLocation:
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
                    break;
                    //棒の高さを指定(Y軸)
                case CPTBarPlotFieldBarTip:
                    num = [self.dataForBar objectAtIndex:index];
                    break;
            }
        }
    } // 折れ線グラフの場合
    else if ( [plot isKindOfClass:[CPTScatterPlot class]] ) {
        if ([plot.identifier isEqual:IDENTIFIER_SCATTER_PLOT]) {
            switch (fieldEnum) {
                case CPTScatterPlotFieldX:  // X軸の値
                    num = [[self.dataForScatter objectAtIndex:index] valueForKey:@"x"];
                    break;
                case CPTScatterPlotFieldY:  // Y軸の値
                    num = [[self.dataForScatter objectAtIndex:index] valueForKey:@"y"];
                    break;
            }
        }
    }
    return num;
}

@end
