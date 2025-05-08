import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(SalesForecastingApp());
}

class SalesForecastingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales Forecasting',
      home: SalesDashboardPage(),
    );
  }
}

class SalesDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Sales Forecasting Dashboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Overview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MetricCard(title: "Total Revenue", value: "\$350K"),
                MetricCard(title: "Forecasted", value: "\$420K"),
                MetricCard(title: "Growth", value: "+20%"),
              ],
            ),
            SizedBox(height: 20),
            Text("Sales Trend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Expanded(child: SalesLineChart()),
          ],
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;

  MetricCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

class SalesLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                    return Text(labels[value.toInt() % labels.length]);
                  },
                  reservedSize: 30,
                ),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 30),
                  FlSpot(1, 35),
                  FlSpot(2, 40),
                  FlSpot(3, 50),
                  FlSpot(4, 60),
                  FlSpot(5, 70),
                ],
                isCurved: true,
                barWidth: 3,
                belowBarData: BarAreaData(show: true, color: Colors.blueAccent.withOpacity(0.3)),
                color: Colors.blueAccent,
                dotData: FlDotData(show: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
