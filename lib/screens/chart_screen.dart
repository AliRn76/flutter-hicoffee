
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class ChartScreen extends StatefulWidget {


  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  bool condition = false;

  @override
  Widget build(BuildContext context) {
    String value;
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_up),
          iconSize: 35.0,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.indigo[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "نمودار های فروش",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: "BNazanin",
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "فروش کل:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "BNazanin",
                    ),
                  ),
                  Text(
                    "۱,۲۰۰,۵۶۰ تومان",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "BNazanin",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "فروش ماه قبل:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "BNazanin",
                    ),
                  ),
                  Text(
                    "۶۰۰,۵۶۰ تومان",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "BNazanin",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "فروش این ماه:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "BNazanin",
                    ),
                  ),
                  Text(
                    "۹۰,۵۶۰ تومان",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "BNazanin",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.show_chart),
                label: Text("کل"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.black87),
                ),
                onPressed: (){
                  setState(() {
                    condition = true;
                    charts.LineChart(_createSampleData1(),
                        defaultRenderer:
                        charts.LineRendererConfig(includeArea: true, stacked: true));
//                    charts.LineChart(_createSampleData1());
                  });
                },
              ),
              RaisedButton.icon(
                icon: Icon(Icons.show_chart),
                label: Text("این ماه"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.black87),
                ),
                onPressed: (){
                  setState(() {
                    condition = false;
                    charts.LineChart(_createSampleData());
                  });
                },
              ),
            ],
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              DropdownButton(
//                value: value,
//                items: [
//                  DropdownMenuItem(
//                    value: "1",
//                    child: Text(
//                      " آذر ۹۸",
//                    ),
//                  ),
//                  DropdownMenuItem(
//                    value: "2",
//                    child: Text(
//                      " دی ۹۸",
//                    ),
//                  ),
//                  DropdownMenuItem(
//                    value: "2",
//                    child: Text(
//                      "بهمن ۹۸",
//                    ),
//                  ),
//                  DropdownMenuItem(
//                    value: "2",
//                    child: Text(
//                      "اسفند ۹۸",
//                    ),
//                  ),
//                  DropdownMenuItem(
//                    value: "2",
//                    child: Text(
//                      "فروردین ۹۹",
//                    ),
//                  ),
//                ],
//                onChanged: (value) {
//                  setState(() {
//
//                    condition = false;
//                    charts.LineChart(_createSampleData());
//                  });
//                },
//              ),
//            ],
//          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  height: MediaQuery.of(context).size.width * 0.65,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: _buildChart(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  _buildChart(){
    if(!condition){
      return charts.LineChart(_createSampleData());
    }else{
      return charts.LineChart(_createSampleData1(),
      defaultRenderer:
      charts.LineRendererConfig(includeArea: true, stacked: true));
    }
  }

  List<charts.Series<LinearSales, int>> _createSampleData() {
    final List<LinearSales>data2 = [];
    var rng = Random();
    for(int i=1 ; i<=30 ; i++){
      data2.add(LinearSales(i, rng.nextInt(100)));
    }
    return [
      charts.Series<LinearSales, int>(
        id: 'AllTime',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data2,
      )
    ];
  }



  static List<charts.Series<LinearSales, int>> _createSampleData1() {
    final List<LinearSales>myFakeTabletData = [];
    var rng = Random();
    for(int i=0 ; i<5 ; i++){
      myFakeTabletData.add(LinearSales(i, rng.nextInt(100)));
    }

    final List<LinearSales>myFakeDesktopData = [];
    for(int i=0 ; i<5 ; i++){
      myFakeDesktopData.add(LinearSales(i, rng.nextInt(100)));
    }

    final List<LinearSales>myFakeMobileData = [];
    for(int i=0 ; i<5 ; i++){
      myFakeMobileData.add(LinearSales(i, rng.nextInt(100)));
    }

    final List<LinearSales>data2 = [];
    for(int i=0 ; i<5 ; i++){
      data2.add(LinearSales(i, rng.nextInt(100)));
    }

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Data',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data2,
      ),
    ];
  }
}


/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
