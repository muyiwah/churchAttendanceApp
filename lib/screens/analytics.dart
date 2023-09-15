import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mivattendance/global.dart';
import 'package:mivattendance/models/analytics.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Analytics extends StatefulWidget {
  Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    findGraphData();
    add();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  int currentPage = 0;
  int currentPage2 = 0;
  PageController _controller = PageController();
  PageController _controller2 = PageController();
  String year = "${date.toString().split(' ')[0].split('-')[0]}";
  String januaryMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-01";
  String februaryMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-02";
  String marchMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-03";
  String apirilMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-04";
  String mayMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-05";
  String juneMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-06";
  String julyMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-07";
  String augustMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-08";
  String septemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-09";
  String octoberMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-10";
  String novemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-11";
  String decemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-12";

  List<AnalyticsModel> january = [];
  List<AnalyticsModel> february = [];
  List<AnalyticsModel> march = [];
  List<AnalyticsModel> april = [];
  List<AnalyticsModel> may = [];
  List<AnalyticsModel> june = [];
  List<AnalyticsModel> july = [];
  List<AnalyticsModel> august = [];
  List<AnalyticsModel> september = [];
  List<AnalyticsModel> october = [];
  List<AnalyticsModel> november = [];
  List<AnalyticsModel> december = [];
  List<AnalyticsModel> all = [];
  List<AnalyticsModel> empty = [
    AnalyticsModel(
        abscent: 0,
        resolved: 0,
        unresloved: 0,
        present: 0,
        totalMembers: 0,
        newCommers: 0,
        workers: 0,
        nonWorkers: 0,
        teenagers: 0,
        men: 0,
        women: 0,
        date: '00-00-00',
        children: 0)
  ];

  add() {
    all.addAll(january +
        february +
        march +
        april +
        may +
        june +
        july +
        august +
        september +
        october +
        november +
        december);
    availableMonths();
  }

  List available = [];
  availableMonths() {
    if (january.isNotEmpty) {
      available.add('january');
    }
    if (february.isNotEmpty) {
      available.add('february');
    }
    if (march.isNotEmpty) {
      available.add('march');
    }
    if (april.isNotEmpty) {
      available.add('april');
    }
    if (may.isNotEmpty) {
      available.add('may');
    }
    if (june.isNotEmpty) {
      available.add('june');
    }
    if (july.isNotEmpty) {
      available.add('july');
    }
    if (august.isNotEmpty) {
      available.add('august');
    }
    if (september.isNotEmpty) {
      available.add('september');
    }
    if (october.isNotEmpty) {
      available.add('october');
    }
    if (november.isNotEmpty) {
      available.add('november');
    }
    if (december.isNotEmpty) {
      available.add('december');
    }
  }

  int selector = 0;
  List<AnalyticsModel> selectMonth(e) {
    switch (e) {
      case 'january':
        return january;
      case 'february':
        return february;
      case 'march':
        return march;
      case 'april':
        return april;
      case 'may':
        return may;
      case 'june':
        return june;
      case 'july':
        return july;
      case 'august':
        return august;
      case 'september':
        return september;
      case 'october':
        return october;
      case 'november':
        return november;
      case 'december':
        return december;

      default:
        empty;
    }
    return empty;
    // throw (e) {
    //   print(e);
    // };
  }

  int raiser = 0;
  findGraphData() {
    january = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(januaryMonthYear);

    february = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(februaryMonthYear);

    march = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(marchMonthYear);

    april = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(apirilMonthYear);
    may = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(mayMonthYear);
    june = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(juneMonthYear);
    july = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(julyMonthYear);
    august = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(augustMonthYear);
    september = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(septemberMonthYear);
    october = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(octoberMonthYear);
    november = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(novemberMonthYear);
    december = Provider.of<UserProvider>(context, listen: false)
        .findYearMonth(decemberMonthYear);
  }

  double monthSum(List<AnalyticsModel> data) {
    // if (data.length > 0) {
    //   print(data[0].date);
    // }
    double sum = 0;
    for (int i = 0; data.length > i; i++) {
      sum = data[i].present + sum;
    }
    return sum;
  }

  double averageTotalMembers(List<AnalyticsModel> data) {
    double totalMembers = 0;
    for (int i = 0; data.length > i; i++) {
      totalMembers = data[i].totalMembers + totalMembers;
      totalMembers / data.length;
    }
    return totalMembers;
  }

  List<AnalyticsModel> currentMonth = [];

  List data = <graphData>[
    graphData('Jan', 100, 30),
    // graphData('Feb', 80),
    // graphData('Mar', 30),
    // graphData('Apr', 240),
    // graphData('May', 280),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              text: 'Yearly',
            ),
            Tab(
              text: 'Monthly',
            ),
            Tab(
              text: 'Weekly',
            ),
            Tab(
              text: 'Break-down',
            ),
            Tab(
              text: 'Extra',
            ),
          ]),
        ),
        body: TabBarView(children: [
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Attendance ${year}'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: _tooltipBehavior,
              series: <LineSeries<graphData, String>>[
                LineSeries<graphData, String>(
                    dataSource: [
                      graphData('Jan', monthSum(january),
                          averageTotalMembers(january)),
                      graphData('Feb', monthSum(february),
                          averageTotalMembers(february)),
                      graphData(
                          'Mar', monthSum(march), averageTotalMembers(march)),
                      graphData(
                          'Apr', monthSum(april), averageTotalMembers(april)),
                      graphData('May', monthSum(may), averageTotalMembers(may)),
                      graphData(
                          'Jun', monthSum(june), averageTotalMembers(june)),
                      graphData(
                          'Jul', monthSum(july), averageTotalMembers(july)),
                      graphData(
                          'Aug', monthSum(august), averageTotalMembers(august)),
                      graphData('Sep', monthSum(september),
                          averageTotalMembers(september)),
                      graphData('Oct', monthSum(october),
                          averageTotalMembers(october)),
                      graphData('Nov', monthSum(november),
                          averageTotalMembers(november)),
                      graphData('Dec', monthSum(december),
                          averageTotalMembers(december)),
                    ],
                    xValueMapper: (graphData attendance, _) => attendance.year,
                    yValueMapper: (graphData attendance, _) =>
                        attendance.attendance,
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
          Stack(children: [
            PageView(
              controller: _controller2,
              onPageChanged: (value) {
                currentPage2 = value;
                // setState(() {});
              },
              scrollDirection: Axis.vertical,
              children: available.map((e) {
                raiser++;
                selector = available.length - raiser;
                print('raiser${raiser}');
                print('selector${selector}');
                currentMonth = selectMonth(available[selector]);
                String monthTitile = "";
                if (currentMonth.isNotEmpty) {
                  monthTitile = Provider.of<UserProvider>(context)
                      .findReturnMonthString(currentMonth[0].date);
                }
                return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Attendance for $monthTitile'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,
                    series: <LineSeries<graphData, String>>[
                      LineSeries<graphData, String>(
                          dataSource: [
                            graphData(
                                'Week 1',
                                currentMonth.length > 0
                                    ? currentMonth[0].present
                                    : 30,
                                0),
                            graphData(
                                'Week 2',
                                currentMonth.length > 1
                                    ? currentMonth[1].present
                                    : 0,
                                0),
                            graphData(
                                'Week 3',
                                currentMonth.length > 2
                                    ? currentMonth[2].present
                                    : 0,
                                0),
                            graphData(
                                'Week 4',
                                currentMonth.length > 3
                                    ? currentMonth[3].present
                                    : 0,
                                0),
                            graphData(
                                'Week 5',
                                currentMonth.length > 4
                                    ? currentMonth[4].present
                                    : 0,
                                0),
                          ],
                          xValueMapper: (graphData attendance, _) =>
                              attendance.year,
                          yValueMapper: (graphData attendance, _) =>
                              attendance.attendance,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]);
              }).toList(),
            ),
            Positioned(
              top: 60,
              right: 10,
              child: Container(
                child: Column(
                  children: [
                    // if (currentPage2 != 0)
                    InkWell(
                      onTap: () {
                        _controller2.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.arrow_upward,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'swipe for meore',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        _controller2.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
          Stack(children: [
            PageView(
              controller: _controller,
              onPageChanged: (value) {
                currentPage = value;
                // setState(() {});
              },
              scrollDirection: Axis.vertical,
              children: all.reversed.map((e) {
                List<graphDataNEW> data = [];
                data = hi(e);
                return SfCartesianChart(
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior,
                  // Initialize category axis
                  // primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    BarSeries<graphDataNEW, String>(
                        name: 'miv',
                        // Bind data source
                        dataSource: data,
                        xValueMapper: (graphDataNEW attendance, _) =>
                            attendance.year,
                        yValueMapper: (graphDataNEW attendance, _) =>
                            attendance.attendance,
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ],
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  title: ChartTitle(text: 'weekly chart ${e.date}'),
                );
              }).toList(),
              // ]
            ),
            Positioned(
              top: 60,
              right: 10,
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.arrow_upward,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'swipe for meore',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
          SfCircularChart(title: ChartTitle(text: 'This week'),
            legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[PieSeries<graphDataNEW, String>(dataSource: chartData,
                xValueMapper: (graphDataNEW attendance, _) => attendance.year,
                yValueMapper: (graphDataNEW attendance, _) =>
                    attendance.attendance,dataLabelSettings: DataLabelSettings(isVisible: true)
              )],
          ),

          SfSparkLineChart(
            //Enable the trackball
            trackball: SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            //Enable marker
            marker:
                SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
            //Enable data label
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            data: <double>[
              1,
              5,
              -6,
              0,
              1,
              -2,
              7,
              -7,
              -4,
              -10,
              13,
              -6,
              7,
              5,
              11,
              5,
              3
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   //Initialize the spark charts widget
          //   child: SfSparkLineChart.custom(
          //     //Enable the trackball
          //     trackball: SparkChartTrackball(
          //         activationMode: SparkChartActivationMode.tap),
          //     //Enable marker
          //     marker: SparkChartMarker(
          //         displayMode: SparkChartMarkerDisplayMode.all),
          //     //Enable data label
          //     labelDisplayMode: SparkChartLabelDisplayMode.all,
          //     xValueMapper: (int index) => data[index].year,
          //     yValueMapper: (int index) => data[index].attendance,
          //     dataCount: 5,
          //   ),
          // ),
        ]),
      ),
    );
  }

  Map<dynamic, dynamic> d = {'men': 30, 'women': 40, date: '2023-07-03'};
  final h = AnalyticsModel(
      men: 30,
      women: 40,
      abscent: 10,
      resolved: 12,
      unresloved: 13,
      present: 80,
      totalMembers: 128,
      newCommers: 9,
      workers: 120,
      nonWorkers: 18,
      teenagers: 40,
      children: 50,
      date: '2023');

  List<graphDataNEW> hi(AnalyticsModel data) {
    Map k = data.toMap();
    k.remove('date');
    chartData = [];
    k.forEach((key, value) {
      chartData.add(graphDataNEW(
        key.toString(),
        value,
      ));
    });
    return chartData;
  }

  List<graphDataNEW> chartData = [
    // graphData('Mar', 22, 36),
    // graphData('Apro', 20, 30),
    // graphData('mayw', 55, 32),
    // graphData('Ferb', 30, 31),
    // graphData('Mcar', 22, 36),
    // graphData('Apvro', 20, 30),
    // graphData('m ay', 55, 32\),
  ];
}

class AnalyticData {
  AnalyticData(this.year, this.attendance, this.totalMembers);
  final String year;
  final double attendance;
  final double totalMembers;
}

class graphData {
  graphData(this.year, this.attendance, this.totalMembers);
  final String year;
  final double attendance;
  final double totalMembers;
}

class graphDataNEW {
  graphDataNEW(
    this.year,
    this.attendance,
  );
  final String year;
  final double attendance;
}
