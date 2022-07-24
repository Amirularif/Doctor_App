import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FitSleepGraph extends StatefulWidget {
  const FitSleepGraph({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<FitSleepGraph> createState() => _FitSleepGraphState(token);
}

class _FitSleepGraphState extends State<FitSleepGraph> {
  String token;
  _FitSleepGraphState(this.token);

  List finalData = [];
  List<SleepData> sleepData = []; 
  String testdata = '';
  String encdata = '[';
  List testdata2 = [];

  Future dataReq() async {
    var headers = {
      "Authorization" : "Bearer $token"
    };

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print('date today : $formattedDate');

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1.2/user/-/sleep/date/2022-07-10.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    if(data["sleep"] == null){
      print("error no data");
    }else{
      sleepData = [
        SleepData("deep",
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["deep"]["count"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["deep"]["minutes"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["deep"]["thirtyDayAvgMinutes"]))
        ),
        SleepData("light",
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["light"]["count"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["light"]["minutes"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["light"]["thirtyDayAvgMinutes"]))
        ),
        SleepData("rem",
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["rem"]["count"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["rem"]["minutes"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["rem"]["thirtyDayAvgMinutes"]))
        ),
        SleepData("wake",
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["wake"]["count"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["wake"]["minutes"])),
          int.parse(json.encode(data["sleep"][0]["levels"]["summary"]["wake"]["thirtyDayAvgMinutes"]))
        )
      ];
    }
    
    //x.sleep[0].levels.summary
    print("check value");
    print(sleepData[0].mins);

    
    if (response.statusCode == 200) {  
      print('responseData success');
    }
    else {
      print(response.reasonPhrase);
    }
    return responseData;
  }

  void initState(){
    dataReq();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 320,
        height: 220,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12)
        ),
        child: FutureBuilder(
          future: dataReq(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {     
              return SfCartesianChart(  
                title: ChartTitle(
                  text:"Sleep Log", 
                  textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  )
                ),
                primaryXAxis: CategoryAxis(),
                axes: <ChartAxis>[
                  NumericAxis(
                    numberFormat: NumberFormat.compact(),
                    majorGridLines: const MajorGridLines(width: 0),
                    opposedPosition: true,
                    name: 'yAxis1',
                    interval: 5,
                    minimum: 0,
                    maximum: 50
                  ),
                ],
                series: <ChartSeries>[
                  ColumnSeries<SleepData, String>(
                    animationDuration: 2000,
                    dataSource: sleepData,
                    width: 0.5,
                    xValueMapper: (SleepData data, _) => data.status,
                    yValueMapper: (SleepData data, _) => data.mins,
                  ),
                  ColumnSeries<SleepData, String>(
                    animationDuration: 2000,
                    dataSource: sleepData,
                    width: 0.5,
                    xValueMapper: (SleepData data, _) => data.status,
                    yValueMapper: (SleepData data, _) => data.avgmins,
                  ),
                  ScatterSeries<SleepData, String>(
                    animationDuration: 4500,
                    dataSource: sleepData,
                    xValueMapper: (SleepData data, _) => data.status,
                    yValueMapper: (SleepData data, _) => data.count,
                    yAxisName: 'yAxis1',
                    markerSettings: MarkerSettings(isVisible: true),
                  ),
                ]
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            } 
          }
        )
      )
    );
  }
}

class SleepData{
  SleepData(this.status, this.count, this.mins, this.avgmins);
  final String status;
  final int count;
  final int mins;
  final int avgmins;
}