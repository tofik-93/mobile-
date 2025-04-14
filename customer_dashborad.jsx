import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomerDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> segments = [
    {
      "label": "Loyal",
      "forecast": 550.0,
      "growth": "+5.2%",
      "color": Colors.green,
    },
    {
      "label": "New",
      "forecast": 120.0,
      "growth": "+12.8%",
      "color": Colors.blue,
    },
    {
      "label": "Churned",
      "forecast": 80.0,
      "growth": "-3.5%",
      "color": Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final barGroups = segments.asMap().entries.map((entry) {
      int index = entry.key;
      var data = entry.value;
      return BarChartGroupData(x: index, barRods: [
        BarChartRodData(
          toY: data['forecast'],
          color: data['color'],
          width: 22,
        )
      ]);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Customer Segmentation Dashboard")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Chart
              AspectRatio(
                aspectRatio: 1.6,
                child: BarChart(
                  BarChartData(
                    maxY: 600,
                    barGroups: barGroups,
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final style = TextStyle(
                                color: Colors.black, fontSize: 12);
                            if (value.toInt() < segments.length) {
                              return Text(segments[value.toInt()]['label'],
                                  style: style);
                            }
                            return Text('', style: style);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // List
              ListView.builder(
                itemCount: segments.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final segment = segments[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: segment['color'],
                      ),
                      title: Text(
                        segment['label'] + " Customers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "Forecast: ETB ${segment['forecast'].toStringAsFixed(0)}"),
                      trailing: Text(
                        segment['growth'],
                        style: TextStyle(
                          color: segment['color'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
