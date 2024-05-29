import 'package:fl_chart/fl_chart.dart';

class FundData {
  final String fundID;
  final Map<String, List<FlSpot>> monthlyData;

  FundData({
    required this.fundID,
    required this.monthlyData,
  });
}
