import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const SalesForecastApp());
}

class SalesForecastApp extends StatelessWidget {
  const SalesForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Forecast for Investor Product',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SalesForecastScreen(),
    );
  }
}

class SalesForecastScreen extends StatefulWidget {
  const SalesForecastScreen({super.key});

  @override
  _SalesForecastScreenState createState() => _SalesForecastScreenState();
}

class _SalesForecastScreenState extends State<SalesForecastScreen> {
  // Sample historical sales data (e.g., monthly sales in thousands or stock prices)
  List<double> historicalData = [100, 120, 130, 140, 150, 160, 170];
  double? forecastedValue;
  final int movingAverageWindow = 3; // 3-period moving average

  // Function to calculate moving average forecast
  double calculateMovingAverageForecast(List<double> data, int window) {
    if (data.length < window) return data.last;
    final sublist = data.sublist(data.length - window);
    return sublist.reduce((a, b) => a + b) / window;
  }

  // Function to trigger forecast
  void forecastSales() {
    setState(() {
      forecastedValue = calculateMovingAverageForecast(historicalData, movingAverageWindow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investor Product Sales Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historical Sales Data (in thousands):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(historicalData.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: forecastSales,
              child: const Text('Generate Forecast'),
            ),
            const SizedBox(height: 20),
            if (forecastedValue != null)
              Text(
                'Forecasted Next Period Sales: \$${forecastedValue!.toStringAsFixed(2)}K',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            const SizedBox(height: 20),
            const Text(
              'Sales Trend Chart:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: const FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        // Historical data points
                        for (int i = 0; i < historicalData.length; i++)
                          FlSpot(i.toDouble(), historicalData[i]),
                        // Forecasted point
                        if (forecastedValue != null)
                          FlSpot(historicalData.length.toDouble(), forecastedValue!),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                  minX: 0,
                  maxX: historicalData.length.toDouble() + (forecastedValue != null ? 1 : 0),
                  minY: historicalData.reduce((a, b) => a < b ? a : b) - 10,
                  maxY: historicalData.reduce((a, b) => a > b ? a : b) + 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
