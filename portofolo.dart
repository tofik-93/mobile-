import 'package:flutter/material.dart';

class PortfolioSummaryPage extends StatelessWidget {
  const PortfolioSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Portfolio Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              title: 'Total Investment',
              value: '\$1.2M',
              icon: Icons.account_balance_wallet,
              color: Colors.blueAccent,
            ),
            _buildSummaryCard(
              title: 'Current Value',
              value: '\$1.45M',
              icon: Icons.trending_up,
              color: Colors.green,
            ),
            _buildSummaryCard(
              title: 'Return Rate',
              value: '20.8%',
              icon: Icons.percent,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 32),
            const Text(
              'Asset Allocation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildAssetTile('Tech Stocks', '\$450K', 0.37),
                  _buildAssetTile('Retail', '\$300K', 0.25),
                  _buildAssetTile('Real Estate', '\$250K', 0.21),
                  _buildAssetTile('Healthcare', '\$200K', 0.17),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildAssetTile(String name, String value, double percentage) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(name),
        subtitle: LinearProgressIndicator(
          value: percentage,
          color: Colors.teal,
          backgroundColor: Colors.teal.withOpacity(0.2),
        ),
        trailing: Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
