import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/model/saleschartmodel.dart';
import 'package:kalender_pertanian_ta/services/salesChartService.dart';
import 'package:kalender_pertanian_ta/services/salesService.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chartProduksi extends StatefulWidget {
  const chartProduksi({super.key});

  @override
  State<chartProduksi> createState() => _chartProduksiState();
}

class _chartProduksiState extends State<chartProduksi> {
  
  late Future<SalesChartList> salesChartData;

  @override
  void initState() {
    super.initState();
    salesChartData = SalesChartService().getSalesChart();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SalesChartList>(
      future: salesChartData, 
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error Fetching API, Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.tanaman.isEmpty) {
          return Text('No data available');
        } else {
          final chartData = snapshot.data!;
          return SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            // Chart title
            title: const ChartTitle(
                text: 
                'Volume Penjualan Tanaman',
                textStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            // Enable legend
            legend: const Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<SalesChart, String>>[
              BarSeries<SalesChart, String>(
                  dataSource: chartData.tanaman,
                  xValueMapper: (SalesChart sales, _) => sales.tanaman,
                  yValueMapper: (SalesChart sales, _) => sales.volumePenjualan,
                  name: 'Volume Penjualan',
                  color: GlobalColors.mainColor,
                  // Enable data label
                  dataLabelSettings:
                      const DataLabelSettings(isVisible: true))
            ]);
        }
      }
    );
  }
}
