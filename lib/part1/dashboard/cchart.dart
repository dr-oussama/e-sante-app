import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/chartpat.dart';
import 'package:hepius/part1/dashboard/api/chartpatApi.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Cchart extends StatefulWidget {
  const Cchart({Key? key}) : super(key: key);
  @override
  State<Cchart> createState() => _CchartState();
}

class _CchartState extends State<Cchart> {

  late List<Allchart> chartpatient = [];

  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final chartpatient = await AllchartApi.getchartcure();

    setState(() => this.chartpatient = chartpatient);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Allchart , String>> patients =[
      charts.Series(
        id: "Patients",
        data: chartpatient,
        domainFn: (Allchart patient, _) => patient.year,
        measureFn: (Allchart patient, _) => int.parse(patient.number),
      )
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients By Year',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: size.width,
            height: size.height*.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: charts.BarChart(patients, animate: true,),
          ),
        ),
      ),
    );
  }
}