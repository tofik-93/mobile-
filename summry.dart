import 'package:flutter/material.dart';

class PortfolioSummaryPage extends StatelessWidget {
  const PortfolioSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Portfolio Summary'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Your Investments',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPortfolioCard(
              sector: 'E-commerce',
              invested: 'UGX 10M',
              returns: 'UGX 13.5M',
              growth: '35%',
              color: Colors.green,
            ),
            _buildPortfolioCard(
              sector: 'Agriculture',
              invested: 'UGX 5M',
              returns: 'UGX 6.1M',
              growth: '22%',
              color: Colors.teal,
            ),
            _buildPortfolioCard(
              sector: 'Energy',
              invested: 'UGX 8M',
              returns: 'UGX 10.5M',
              growth: '31%',
              color: Colors.orange,
            ),
            const SizedBox(height: 30),
            const Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildOverviewTile('Total Invested', 'UGX 23M', Icons.account_balance_wallet, Colors.indigo),
            _buildOverviewTile('Total Returns', 'UGX 30.1M', Icons.trending_up, Colors.green),
            _buildOverviewTile('Overall Growth', '30.9%', Icons.bar_chart, Colors.blueAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioCard({
    required String sector,
    required String invested,
    required String returns,
    required String growth,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sector,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Invested: $invested',
                    style: const TextStyle(fontSize: 15, color: Colors.black87)),
                Text('Returns: $returns',
                    style: const TextStyle(fontSize: 15, color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Growth',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                Text(growth,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: color, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTile(String title, String value, IconData icon, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(fontSize: 15)),
    );
  }
}
