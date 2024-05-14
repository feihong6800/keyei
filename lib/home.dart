import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart'; // Make sure this import is correct
import 'package:key_insight/res/colors.dart';
import 'package:key_insight/view_model/home_vm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeVM _homeVM = HomeVM();
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  List<FlSpot> _dataPoints = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    DatabaseEvent event = await _databaseReference.child('fund').once();
    Map data = event.snapshot.value as Map;

    List<FlSpot> dataPoints = [];
    data.forEach((key, value) {
      double x = double.parse(key.toString());
      double y = double.parse(value.toString());
      dataPoints.add(FlSpot(x, y));
    });

    setState(() {
      _dataPoints = dataPoints;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: dark,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'Line Chart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _dataPoints.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,

                      // Customize other properties as needed
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      // Customize other properties as needed
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _dataPoints,
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
