import 'package:flutter/material.dart';

class PortfolioSummaryPage extends StatelessWidget {
  const PortfolioSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Portfolio Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Investment Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildSummaryCard(
                  icon: Icons.account_balance_wallet_rounded,
                  title: 'Total Investment',
                  value: '\$120,000',
                  color: const Color(0xFF0F9D58),
                ),
                _buildSummaryCard(
                  icon: Icons.trending_up_rounded,
                  title: 'ROI',
                  value: '12.4%',
                  color: const Color(0xFF4285F4),
                ),
                _buildSummaryCard(
                  icon: Icons.bar_chart_rounded,
                  title: 'Annual Yield',
                  value: '6.2%',
                  color: const Color(0xFFFBBC05),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Asset Allocation',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildAssetRow('Stocks', 50, Colors.teal),
            _buildAssetRow('Bonds', 30, Colors.orange),
            _buildAssetRow('Real Estate', 15, Colors.indigo),
            _buildAssetRow('Crypto', 5, Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetRow(String asset, int percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$asset - $percentage%',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: color.withOpacity(0.2),
            color: color,
            minHeight: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }
}
