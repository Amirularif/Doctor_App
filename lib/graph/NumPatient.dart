import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientGraphPage extends StatefulWidget {
  PatientGraphPage({Key? key}) : super(key: key);

  @override
  _PatientGraphPageState createState() => _PatientGraphPageState();
}

class _PatientGraphPageState extends State<PatientGraphPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Below 10', 1),
      _ChartData('11 to 15', 3),
      _ChartData('16 to 18', 6),
      _ChartData('Above 19', 15),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            //primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            //tooltipBehavior: _tooltip,
            legend: Legend(isVisible: true,
            iconWidth: 8,
            iconHeight: 8,
            offset: Offset(-520,-45)),
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                legendIconType: LegendIconType.circle,
                  dataSource: data,
                  onCreateRenderer : (ChartSeries<_ChartData, String> series){
                    return _CustomColumnSeriesRenderer();
                  },
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  name: 'Age Distribution',
                  color: Colors.black54)
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class _ColumnCustomPainter extends ColumnSegment {
  @override
  int get currentSegmentIndex => super.currentSegmentIndex!;
  @override
  void onPaint(Canvas canvas) {
    final List<LinearGradient> gradientList = <LinearGradient>[
      const LinearGradient(
          colors: <Color>[Colors.cyan, Colors.greenAccent],
          stops: <double>[0.2, 0.9]
      ),
      const LinearGradient(
          colors: <Color>[Colors.pink, Colors.purpleAccent],
          stops: <double>[0.2, 0.9]
      ),
      const LinearGradient(
          colors: <Color>[Colors.deepPurple, Colors.blue],
          stops: <double>[0.2, 0.9]
      ),
      const LinearGradient(
          colors: <Color>[Colors.deepOrange, Colors.amber],
          stops: <double>[0.2, 0.9]
      ),
    ];

    fillPaint!.shader =
        gradientList[currentSegmentIndex].createShader(segmentRect.outerRect);

    super.onPaint(canvas);
  }
}

class _CustomColumnSeriesRenderer extends ColumnSeriesRenderer {
  _CustomColumnSeriesRenderer();
  @override
  ChartSegment createSegment() {
    return _ColumnCustomPainter();
  }
}