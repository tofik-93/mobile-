import 'package:flutter/material.dart';

class InvestorAnalyticsPage extends StatelessWidget {
  const InvestorAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FA),
      appBar: AppBar(
        title: const Text('Investor Analytics', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Performance Metrics',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildMetricCard('Net Worth Growth', '↑ 8.3%', Icons.trending_up, Colors.green),
            _buildMetricCard('Volatility Index', 'Medium Risk', Icons.warning_amber, Colors.orange),
            _buildMetricCard('Diversification Score', 'High', Icons.scatter_plot, Colors.blue),
            const SizedBox(height: 30),
            const Text(
              'Risk Exposure',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRiskRow('Stocks', 60, Colors.teal),
            _buildRiskRow('Crypto', 25, Colors.redAccent),
            _buildRiskRow('Real Estate', 10, Colors.indigo),
            _buildRiskRow('Bonds', 5, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color iconColor) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(value, style: TextStyle(color: iconColor, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildRiskRow(String category, int percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$category - $percentage%', style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          LinearProgressIndicator(
