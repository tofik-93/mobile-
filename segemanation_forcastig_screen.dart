import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SegmentationForecastScreen extends StatefulWidget {
  @override
  _SegmentationForecastScreenState createState() =>
      _SegmentationForecastScreenState();
}

class _SegmentationForecastScreenState
    extends State<SegmentationForecastScreen> {
  String selectedRange = 'Weekly';

  final Map<String, List<Map<String, dynamic>>> dataByRange = {
    'Weekly': [
      {'label': 'Loyal', 'value': 120.0, 'color': Colors.green},
      {'label': 'New', 'value': 40.0, 'color': Colors.blue},
      {'label': 'Churned', 'value': 20.0, 'color': Colors.red},
    ],
    'Monthly': [
      {'label': 'Loyal', 'value': 550.0, 'color': Colors.green},
      {'label': 'New', 'value': 120.0, 'color': Colors.blue},
      {'label': 'Churned', 'value': 80.0, 'color': Colors.red},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentData = dataByRange[selectedRange]!;

    return Scaffold(
      appBar: AppBar(title: Text("Segmentation Forecast")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Forecast Range:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  value: selectedRange,
                  items: ['Weekly', 'Monthly']
                      .map((range) =>
                          DropdownMenuItem(value: range, child: Text(range)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRange = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Total Forecast
            Card(
              color: Colors.grey.shade100,
              child: ListTile(
                title: Text(
                  "Total Forecast",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "ETB ${currentData.fold<double>(0, (sum, item) => sum + item['value']).toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bar Chart
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  maxY: selectedRange == 'Weekly' ? 150 : 600,
                  borderData: FlBorderData(show: false),
                  barGroups: currentData.asMap().entries.map((entry) {
                    int index = entry.key;
                    var data = entry.value;
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: data['value'],
                          color: data['color'],
                          width: 22,
                        )
                      ],
                    );
                  }).toList(),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final style =
                              TextStyle(color: Colors.black, fontSize: 12);
                          if (value.toInt() < currentData.length) {
                            return Text(
                              currentData[value.toInt()]['label'],
                              style: style,
                            );
                          }
                          return Text('', style: style);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
