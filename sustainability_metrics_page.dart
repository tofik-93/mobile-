import 'package:flutter/material.dart';

class SustainabilityMetricsPage extends StatelessWidget {
  const SustainabilityMetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text('Sustainability Metrics', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Environmental, Social & Governance (ESG)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildESGCard('Environmental Score', 76, Icons.eco, Colors.green),
            _buildESGCard('Social Impact Score', 64, Icons.people_alt, Colors.blueAccent),
            _buildESGCard('Governance Score', 81, Icons.balance, Colors.orange),
            const SizedBox(height: 30),
            const Text(
              'Carbon Footprint Reduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildProgressBar('Last Month', 0.45, Colors.teal),
            const SizedBox(height: 10),
            _buildProgressBar('Last 6 Months', 0.72, Colors.teal),
            const SizedBox(height: 10),
            _buildProgressBar('Year to Date', 0.87, Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildESGCard(String title, int score, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Score: $score / 100', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildProgressBar(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: value,
          backgroundColor: color.withOpacity(0.2),
          color: color,
          minHeight: 10,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}
