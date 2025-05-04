import 'package:flutter/material.dart';

class BusinessInsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business & Investor Insights"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Investor Summary
          _buildCard("Investor Summary", [
            _buildRow("Total Investment", "\$500,000"),
            _buildRow("ROI (Annual)", "18%"),
            _buildRow("Active Investors", "12"),
          ]),

          SizedBox(height: 20),

          // Customer Insights
          _buildCard("Customer Trends", [
            _buildRow("Returning Customers", "68%"),
            _buildRow("New Signups", "1,230"),
            _buildRow("Avg. Order Value", "\$72"),
          ]),

          SizedBox(height: 20),

          // Strategic Suggestions
          _buildCard("Strategic Recommendations", [
            _buildBullet("Expand digital campaigns in top-performing regions."),
            _buildBullet("Focus promotions on high-conversion weekdays."),
            _buildBullet("Introduce loyalty programs for recurring buyers."),
          ]),
        ],
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
