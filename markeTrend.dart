import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketTrendsPage extends StatefulWidget {
  const MarketTrendsPage({Key? key}) : super(key: key);

  @override
  State<MarketTrendsPage> createState() => _MarketTrendsPageState();
}

class _MarketTrendsPageState extends State<MarketTrendsPage> {
  String selectedRegion = 'Global';

  final List<String> regions = ['Global', 'North America', 'Europe', 'Asia', 'Africa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Market Trends'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header and region selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Regional Insights',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedRegion,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedRegion = value;
                      });
                    }
                  },
                  items: regions.map((region) {
                    return DropdownMenuItem(value: region, child: Text(region));
                  }).toList(),
                )
              ],
            ),
            const SizedBox(height: 20),

            /// Trend card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.trending_up, color: Color(0xFF4CAF50)),
                        const SizedBox(width: 8),
                        Text(
                          'Q1 Sales Growth in $selectedRegion',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true, drawVerticalLine: false),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) => Text(['Jan', 'Feb', 'Mar', 'Apr', 'May'][value.toInt()]),
                                reservedSize: 32,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) => Text('${value.toInt()}k'),
                                reservedSize: 40,
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 45),
                                FlSpot(1, 60),
                                FlSpot(2, 80),
                                FlSpot(3, 65),
                                FlSpot(4, 90),
                              ],
                              isCurved: true,
                              color: const Color(0xFF00BFA5),
                              barWidth: 4,
                              belowBarData: BarAreaData(
                                show: true,
                                color: const Color(0xFF00BFA5).withOpacity(0.2),
                              ),
                              dotData: FlDotData(show: false),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Summary cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('YoY Growth', '+15%', Colors.blueAccent),
                _buildStatCard('Forecast Accuracy', '92%', Colors.deepPurple),
                _buildStatCard('Market Share', '27%', Colors.teal),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
