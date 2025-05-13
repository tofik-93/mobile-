import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketTrendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Market Trends", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTrendHeader(),
            SizedBox(height: 20),
            _buildTrendChart(),
            SizedBox(height: 20),
            _buildInsights(),
            SizedBox(height: 20),
            _buildRecommendations(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Top Performing Sectors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: 'Last 30 Days',
          items: ['Last 7 Days', 'Last 30 Days', 'Quarter'].map((value) {
            return DropdownMenuItem(value: value, child: Text(value));
          }).toList(),
          onChanged: (val) {},
        ),
      ],
    );
  }

  Widget _buildTrendChart() {
    return Container(
      height: 250,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
      ),
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 6, color: Colors.green)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 4.5, color: Colors.blue)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3.8, color: Colors.purple)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 5.1, color: Colors.orange)]),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  switch (value.toInt()) {
                    case 0: return Text("Retail");
                    case 1: return Text("Tech");
                    case 2: return Text("Energy");
                    case 3: return Text("Healthcare");
                  }
                  return Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInsights() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEDFDFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF00E096)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Investor Insight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text("Tech sector shows consistent growth over the last month. Energy is recovering from a dip, while Retail is stable."),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommendations", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        _buildRecommendationCard("💼 Invest in Tech Startups", "Backed by rising demand and solid Q1 results."),
        _buildRecommendationCard("📈 Watch Healthcare Sector", "Predicted to grow with policy changes."),
      ],
    );
  }

  Widget _buildRecommendationCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.trending_up, color: Colors.teal),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
