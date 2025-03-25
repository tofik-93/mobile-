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
      home: SalesReportPage(),
    );
  }
}

class SalesReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Forecasting Report'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sales Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SummaryCard(title: "Total Sales", value: "\$120,000"),
                SummaryCard(title: "Profit", value: "\$30,000"),
                SummaryCard(title: "Growth", value: "+12.5%"),
              ],
            ),
            SizedBox(height: 20),

            // Sales Chart
            Expanded(
              flex: 2,
              child: SalesChart(),
            ),
            SizedBox(height: 20),

            // Sales Data Table
            Expanded(
              flex: 3,
              child: SalesDataTable(),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Summary Cards
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  SummaryCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(16),
        width: 120,
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 18, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

// Widget for Sales Line Chart
class SalesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 5000),
                  FlSpot(1, 8000),
                  FlSpot(2, 12000),
                  FlSpot(3, 18000),
                  FlSpot(4, 25000),
                  FlSpot(5, 30000),
                ],
                isCurved: true,
                colors: [Colors.blue],
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
              ),
            ],
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: true),
          ),
        ),
      ),
    );
  }
}

// Widget for Sales Data Table
class SalesDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Month')),
            DataColumn(label: Text('Sales')),
            DataColumn(label: Text('Profit')),
          ],
          rows: [
            DataRow(cells: [DataCell(Text('Jan')), DataCell(Text('\$20,000')), DataCell(Text('\$5,000'))]),
            DataRow(cells: [DataCell(Text('Feb')), DataCell(Text('\$25,000')), DataCell(Text('\$6,000'))]),
            DataRow(cells: [DataCell(Text('Mar')), DataCell(Text('\$30,000')), DataCell(Text('\$8,000'))]),
            DataRow(cells: [DataCell(Text('Apr')), DataCell(Text('\$35,000')), DataCell(Text('\$9,000'))]),
          ],
        ),
      ),
    );
  }
}
