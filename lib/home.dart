import 'package:flutter/material.dart';

import 'package:key_insight/view_model/lineChart_vm.dart';
import 'package:key_insight/widget/line_chart_widget.dart';
import '../model/fund_model.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  late Future<List<FundData>> futureFundData;
  final LineChartVM lineChartVM = LineChartVM();

  @override
  void initState() {
    super.initState();
    futureFundData = lineChartVM.fetchFundData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
      ),
      body: FutureBuilder<List<FundData>>(
        future: futureFundData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Found'));
          } else {
            return LineChartWidget(fundData: snapshot.data!);
          }
        },
      ),
    );
  }
}
