import 'package:flutter/material.dart';

class SalesInsightsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Insights'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InsightCard(
              title: 'Top Customer Segment',
              subtitle: 'Returning Users',
              icon: Icons.people,
              color: Colors.teal,
            ),
            InsightCard(
              title: 'Best Selling Product',
              subtitle: 'Wireless Headphones',
              icon: Icons.headset,
              color: Colors.deepPurple,
            ),
            InsightCard(
              title: 'Forecast Trend',
              subtitle: '+18% Expected Growth (Next Month)',
              icon: Icons.trending_up,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class InsightCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const InsightCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
