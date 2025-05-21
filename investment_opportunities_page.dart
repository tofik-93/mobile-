import 'package:flutter/material.dart';

class InvestmentOpportunitiesPage extends StatelessWidget {
  const InvestmentOpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Investment Opportunities'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Top Performing Sectors',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildOpportunityCard(
              title: 'E-commerce Growth',
              description: 'High ROI projected in East African online retail platforms.',
              roi: '23.5%',
              color: Colors.green,
            ),
            _buildOpportunityCard(
              title: 'Agritech Startups',
              description: 'Innovative agriculture solutions are gaining traction.',
              roi: '18.2%',
              color: Colors.teal,
            ),
            _buildOpportunityCard(
              title: 'Renewable Energy',
              description: 'Sustainable energy investments with long-term gains.',
              roi: '27.1%',
              color: Colors.orange,
            ),
            const SizedBox(height: 30),
            const Text(
              'Recommended for You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildRecommendationTile(
              'Logistics Optimization',
              'Improving regional supply chain efficiency',
              Icons.local_shipping,
              Colors.blueAccent,
            ),
            _buildRecommendationTile(
              'Healthcare Expansion',
              'Private clinic networks in underserved areas',
              Icons.local_hospital,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpportunityCard({
    required String title,
    required String description,
    required String roi,
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
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 15, color: Colors.black87)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Projected ROI',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600])),
                Text(roi,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: color, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationTile(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Add navigation logic if needed
      },
    );
  }
}
