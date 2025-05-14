import 'package:flutter/material.dart';

class InvestmentOpportunitiesPage extends StatelessWidget {
  const InvestmentOpportunitiesPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> opportunities = const [
    {
      'title': 'Organic Snacks Market',
      'growth': '+12.8%',
      'description': 'High growth expected in East African regions, especially among health-conscious youth.',
      'risk': 'Low Risk',
      'color': Colors.green,
    },
    {
      'title': 'Solar Home Systems',
      'growth': '+18.2%',
      'description': 'Booming demand in off-grid rural areas; supported by government incentives.',
      'risk': 'Medium Risk',
      'color': Colors.orange,
    },
    {
      'title': 'EdTech Platforms',
      'growth': '+23.4%',
      'description': 'Rapid adoption by universities and secondary schools across the region.',
      'risk': 'High Return',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Opportunities'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: opportunities.length,
        itemBuilder: (context, index) {
          final item = opportunities[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(item['description'], style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(item['growth'], style: const TextStyle(color: Colors.white)),
                        backgroundColor: item['color'],
                      ),
                      Text(item['risk'], style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
