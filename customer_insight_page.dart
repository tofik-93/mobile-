import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomerInsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Insights"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Header
            Text(
              'Customer Behavior Analysis',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Understand how your customers are buying and predicting future trends.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Customer Purchase Frequency Chart
            Text("Purchase Frequency", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: true),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 10, color: Colors.blue)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 14, color: Colors.blue)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8, color: Colors.blue)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 16, color: Colors.blue)]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Spending Prediction
            Text("Spending Prediction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.trending_up, size: 50, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      "Expected Customer Spending: +18% next quarter",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Top Customers
            Text("Top Customers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(child: Text("A")),
              title: Text("Alice Johnson"),
              subtitle: Text("Total Purchase: \$12,000"),
            ),
            ListTile(
              leading: CircleAvatar(child: Text("B")),
              title: Text("Brian Smith"),
              subtitle: Text("Total Purchase: \$10,500"),
            ),
            ListTile(
              leading: CircleAvatar(child: Text("C")),
              title: Text("Catherine Lee"),
              subtitle: Text("Total Purchase: \$9,800"),
            ),
          ],
        ),
      ),
    );
  }
}
