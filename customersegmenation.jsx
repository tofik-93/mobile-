import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(CustomerSegmentationApp());

class CustomerSegmentationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomerSegmentationChart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomerSegmentationChart extends StatelessWidget {
  final List<BarChartGroupData> barGroups = [
    BarChartGroupData(x: 0, barRods: [
      BarChartRodData(toY: 550, color: Colors.green, width: 22)
    ], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(toY: 120, color: Colors.blue, width: 22)
    ], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(toY: 80, color: Colors.red, width: 22)
    ], showingTooltipIndicators: [0]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Segmentation Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 600,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getSegmentTitles,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: barGroups,
          ),
        ),
      ),
    );
  }

  Widget getSegmentTitles(double value, TitleMeta meta) {
    final style = TextStyle(color: Colors.black, fontSize: 12);
    switch (value.toInt()) {
      case 0:
        return Text('Loyal', style: style);
      case 1:
        return Text('New', style: style);
      case 2:
        return Text('Churned', style: style);
      default:
        return Text('', style: style);
    }
  }
}
