import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/fund_model.dart';


class LineChartWidget extends StatelessWidget {
  final List<FundData> fundData;

  const LineChartWidget({Key? key, required this.fundData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1000, // Adjust width as needed
        child: LineChart(
          LineChartData(
            lineBarsData: fundData.expand((data) {
              return data.monthlyData.entries.map((entry) {
                return LineChartBarData(
                  spots: entry.value,
                  isCurved: true,
                  barWidth: 2,
                  colors: [Colors.blue],
                  belowBarData: BarAreaData(show: false),
                );
              }).toList();
            }).toList(),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: true),
              bottomTitles: SideTitles(showTitles: true),
            ),
          ),
        ),
      ),
    );
  }
}
