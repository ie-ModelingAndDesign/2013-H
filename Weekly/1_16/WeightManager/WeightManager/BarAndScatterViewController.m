//
//  BarAndScatterViewController.m
//  WeightManager
//
//  Created by Chie AHAREN on 2014/01/09.
//  Copyright (c) 2014年 Yukiya IHA. All rights reserved.
//



#import "BarAndScatterViewController.h"

// 折れ線グラフの識別子
NSString *const kData   = @"Data Source Plot";

@interface BarAndScatterViewController ()

@end

@implementation BarAndScatterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // グラフに表示するデータを生成
    self.scatterPlotData = [NSMutableArray array];
    self.Mokuhyo = [NSMutableArray array];

    //1週間のデータ
    
    // NsDate => NSString変換用のフォーマットを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    
    
    NSDate *day1 = [NSDate dateWithTimeIntervalSinceNow:-6*24*60*60];
    NSDate *day2 = [NSDate dateWithTimeIntervalSinceNow:-5*24*60*60];
    NSDate *day3 = [NSDate dateWithTimeIntervalSinceNow:-4*24*60*60];
    NSDate *day4 = [NSDate dateWithTimeIntervalSinceNow:-3*24*60*60];
    NSDate *day5 = [NSDate dateWithTimeIntervalSinceNow:-2*24*60*60];
    NSDate *day6 = [NSDate dateWithTimeIntervalSinceNow:-1*24*60*60];
    NSDate *day7 = [NSDate dateWithTimeIntervalSinceNow:0*24*60*60];

    [df setDateFormat:@"yyyyMMdd"];
    
    
    NSString *sday1 = [df stringFromDate:day1];
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *save1 = [defaults1 stringForKey:sday1];
    if (save1 == nil) {
        save1 = @"0";
    }
    
    NSString *sday2 = [df stringFromDate:day2];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *save2 = [defaults2 stringForKey:sday2];
    if (save2 == nil) {
        save2 = @"0";
    }
    
    NSString *sday3 = [df stringFromDate:day3];
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    NSString *save3 = [defaults3 stringForKey:sday3];
    if (save3 == nil) {
        save3 = @"0";
    }
    
    NSString *sday4 = [df stringFromDate:day4];
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    NSString *save4 = [defaults4 stringForKey:sday4];
    if (save4 == nil) {
        save4 = @"0";
    }
    
    NSString *sday5 = [df stringFromDate:day5];
    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    NSString *save5 = [defaults5 stringForKey:sday5];
    if (save5 == nil) {
        save5 = @"0";
    }
    
    NSString *sday6 = [df stringFromDate:day6];
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    NSString *save6 = [defaults6 stringForKey:sday6];
    if (save6 == nil) {
        save6 = @"0";
    }
    
    NSString *sday7 = [df stringFromDate:day7];
    NSUserDefaults *defaults7 = [NSUserDefaults standardUserDefaults];
    NSString *save7 = [defaults7 stringForKey:sday7];
    if (save7 == nil) {
        save7 = @"0";
    }
    
    int i = 0;
    
    for (NSString *day in @[save1,save2,save3,save4,save5,save6,save7]) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        NSNumber *y = [NSNumber numberWithInt:[day intValue]];
        [self.scatterPlotData addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
        i++;
    }
    
    
    NSUserDefaults *Mdefaults = [NSUserDefaults standardUserDefaults];
    NSString *Mokuhyo = [Mdefaults stringForKey:@"Mokuhyo"];
    
    
    i = 0;
    
    for (NSString *day in @[Mokuhyo,Mokuhyo,Mokuhyo,Mokuhyo,Mokuhyo,Mokuhyo,Mokuhyo]) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        NSNumber *y = [NSNumber numberWithInt:[day intValue]];
        [self.Mokuhyo addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
        i++;
    }
    
    //残り体重
    int a = [Mokuhyo intValue];
    int b = [save7 intValue];
    
    int result = b - a;
    if (result <= 0) {
        result = 0;
        
        comment.text = [NSString stringWithFormat:@"目標達成！"];
        
    }else{
        comment.text = [NSString stringWithFormat:@"がんばれ！"];
    }
    resultlabel.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%d",result]];
    
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
    
    graph.plotAreaFrame.paddingLeft   = 60.0f;
    graph.plotAreaFrame.paddingTop    = 100.0f;
    graph.plotAreaFrame.paddingRight  = 30.0f;
    graph.plotAreaFrame.paddingBottom = 30.0f;
    
    
    //プロット間隔の設定
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;

    //Y軸は0〜10の値で設定
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(300)];
    
    //X軸は0〜10の値で設定
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(7)];
    
    // テキストスタイル
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.color                = [CPTColor colorWithComponentRed:0.1f green:0.1f blue:0.1f alpha:1.0f];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    
    //罫線スタイル
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0.1f green:0.1f blue:0.1f alpha:0.3f];
    lineStyle.lineWidth            = 2.0f;
    
    //軸スタイル
    CPTMutableLineStyle *axisStyle = [CPTMutableLineStyle lineStyle];
    axisStyle.lineColor            = [CPTColor colorWithComponentRed:0.1f green:0.1f blue:0.1f alpha:1.0f];
    axisStyle.lineWidth            = 2.0f;
    
    
    // X軸のメモリ・ラベルなどの設定
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    CPTXYAxis *x          = axisSet.xAxis;
    x.axisLineStyle               = axisStyle;      // X軸の線にラインスタイルを適用
    x.majorTickLineStyle          = axisStyle;      // X軸の大きいメモリにラインスタイルを適用
    x.minorTickLineStyle          = axisStyle;      // X軸の小さいメモリにラインスタイルを適用
    x.majorIntervalLength         = CPTDecimalFromString(@"1"); // X軸ラベルの表示間隔
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0"); // X軸のY位置
    x.titleTextStyle = textStyle;
    x.titleLocation               = CPTDecimalFromFloat(5.0f);
    x.titleOffset                 = 36.0f;
    //    x.minorTickLength = 5.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    //    x.majorTickLength = 9.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    x.labelTextStyle = textStyle;
    
    // Y軸のメモリ・ラベルなどの設定
    CPTXYAxis *y = axisSet.yAxis;
    y.axisLineStyle               = axisStyle;      // Y軸の線にラインスタイルを適用
    y.majorTickLineStyle          = axisStyle;      // Y軸の大きいメモリにラインスタイルを適用
    y.minorTickLineStyle          = axisStyle;      // Y軸の小さいメモリにラインスタイルを適用
    y.majorTickLength = 9.0f;                   // Y軸の大きいメモリの長さ
    y.minorTickLength = 5.0f;                   // Y軸の小さいメモリの長さ
    y.majorIntervalLength         = CPTDecimalFromFloat(30.0f);  // Y軸ラベルの表示間隔
    y.orthogonalCoordinateDecimal = CPTDecimalFromFloat(0.0f);  // Y軸のX位置
    y.titleTextStyle = textStyle;
    y.titleRotation = M_PI*2;
    y.titleLocation               = CPTDecimalFromFloat(11.0f);
    y.titleOffset                 = 15.0f;
    lineStyle.lineWidth = 0.5f;
    y.majorGridLineStyle = lineStyle;
    y.labelTextStyle = textStyle;
    
    // 折れ線グラフのインスタンスを生成
    CPTScatterPlot *scatterPlot = [[CPTScatterPlot alloc] init];
    scatterPlot.identifier      = @"Plot1";    // 折れ線グラフを識別するために識別子を設定
    scatterPlot.dataSource      = self;     // 折れ線グラフのデータソースを設定
    
    // 折れ線グラフのインスタンスを生成
    CPTScatterPlot *scatterPlot2 = [[CPTScatterPlot alloc] init];
    scatterPlot2.identifier      = @"Plot2";    // 折れ線グラフを識別するために識別子を設定
    scatterPlot2.dataSource      = self;     // 折れ線グラフのデータソースを設定
    
    
    // 折れ線グラフのスタイルを設定
    CPTMutableLineStyle *graphlineStyle = [scatterPlot.dataLineStyle mutableCopy];
    graphlineStyle.lineWidth = 3;// 太さ
    graphlineStyle.lineColor = [CPTColor colorWithComponentRed:1.0f green:0.0f blue:0.0f alpha:1.0f];// 色
    scatterPlot.dataLineStyle = graphlineStyle;

    
    // グラフに折れ線グラフを追加
    [graph addPlot:scatterPlot];

    // 任意の文字列のラベルを表示する
    [self arbitraryLabels:graph];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark Plot Data Source Methods

// 任意の文字列のラベルを表示する
- (void) arbitraryLabels:(CPTGraph*)cpgGraph
{
    //日付取得(1週間分)
    // NsDate => NSString変換用のフォーマットを作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]]; // Localeの指定
    
    [df setDateFormat:@"MM月dd日"];
    
    NSDate *day1 = [NSDate dateWithTimeIntervalSinceNow:-6*24*60*60];
    NSDate *day2 = [NSDate dateWithTimeIntervalSinceNow:-5*24*60*60];
    NSDate *day3 = [NSDate dateWithTimeIntervalSinceNow:-4*24*60*60];
    NSDate *day4 = [NSDate dateWithTimeIntervalSinceNow:-3*24*60*60];
    NSDate *day5 = [NSDate dateWithTimeIntervalSinceNow:-2*24*60*60];
    NSDate *day6 = [NSDate dateWithTimeIntervalSinceNow:-1*24*60*60];
    NSDate *day7 = [NSDate dateWithTimeIntervalSinceNow:0*24*60*60];
    
    NSString *sday1 = [df stringFromDate:day1];
    NSString *sday2 = [df stringFromDate:day2];
    NSString *sday3 = [df stringFromDate:day3];
    NSString *sday4 = [df stringFromDate:day4];
    NSString *sday5 = [df stringFromDate:day5];
    NSString *sday6 = [df stringFromDate:day6];
    NSString *sday7 = [df stringFromDate:day7];
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)cpgGraph.axisSet;
    
    NSMutableArray *labels = [NSMutableArray arrayWithCapacity:7];
    int idx = 0;
    for (NSString *day in @[sday1,sday2,sday3,sday4,sday5,sday6,sday7]) // ラベルの文字列
    {
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:day
                                                       textStyle:axisSet.xAxis.labelTextStyle];
        label.tickLocation = CPTDecimalFromInt(idx); // ラベルを追加するレコードの位置
        label.offset = 5.0f; // 軸からラベルまでの距離
        [labels addObject:label];
        ++idx;
    }
    // X軸に設定
    axisSet.xAxis.axisLabels = [NSSet setWithArray:labels];
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone; // これ重要
    axisSet.xAxis.labelRotation  = M_PI / 3;                // 表示角度
    
}




// グラフに使用する折れ線グラフのデータ数を返す
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    NSUInteger numRecords = 0;
    NSString *identifier  = (NSString *)plot.identifier;
    
    // 折れ線グラフのidentifierにより返すデータ数を変える（複数グラフを表示する場合に必要）
    if ( [identifier isEqualToString:@"Plot1"] ) {
        numRecords = self.scatterPlotData.count;
    }else if ( [identifier isEqualToString:@"Plot2"] ){
        numRecords = self.Mokuhyo.count;
    }
    
    return numRecords;
}

// グラフに使用する折れ線グラフのX軸とY軸のデータを返す
-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSNumber *num        = nil;
    NSString *identifier = (NSString *)plot.identifier;
    
    // 折れ線グラフのidentifierにより返すデータ数を変える（複数グラフを表示する場合に必要）
    if ( [identifier isEqualToString:@"Plot1"] ) {
        switch (fieldEnum) {
            case CPTScatterPlotFieldX:  // X軸の場合
                num = [[self.scatterPlotData objectAtIndex:index] valueForKey:@"x"];
                break;
            case CPTScatterPlotFieldY:  // Y軸の場合
                num = [[self.scatterPlotData objectAtIndex:index] valueForKey:@"y"];
                break;
        }
    }else if ( [identifier isEqualToString:@"Plot2"] ){
        switch (fieldEnum) {
            case CPTScatterPlotFieldX:  // X軸の場合
                num = [[self.Mokuhyo objectAtIndex:index] valueForKey:@"x"];
                break;
            case CPTScatterPlotFieldY:  // Y軸の場合
                num = [[self.Mokuhyo objectAtIndex:index] valueForKey:@"y"];
                break;
        }
    }
    
    return num;
}

@end
