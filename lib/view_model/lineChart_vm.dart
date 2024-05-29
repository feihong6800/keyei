import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/fund_model.dart';

class LineChartVM {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference().child('fund');

  Future<List<FundData>> fetchFundData() async {
    final DatabaseEvent event = await dbRef.once();
    final data = event.snapshot.value as Map<dynamic, dynamic>;

    List<FundData> fundList = [];

    data.forEach((fundKey, fundValue) {
      Map<String, List<FlSpot>> monthlyData = {};

      (fundValue as Map<dynamic, dynamic>).forEach((yearKey, yearValue) {
        (yearValue as Map<dynamic, dynamic>).forEach((monthKey, monthValue) {
          List<FlSpot> dailyData = [];
          for (var dayEntry in monthValue) {
            dayEntry.forEach((dayKey, dayValue) {
              double day = double.parse(dayKey.toString());
              double value = double.parse(dayValue.toString());
              dailyData.add(FlSpot(day, value));
            });
          }
          monthlyData['$yearKey-$monthKey'] = dailyData;
        });
      });

      fundList.add(FundData(
        fundID: fundKey,
        monthlyData: monthlyData,
      ));
    });

    return fundList;
  }
}
