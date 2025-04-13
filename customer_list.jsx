import 'package:flutter/material.dart';

class CustomerSegmentList extends StatelessWidget {
  final List<Map<String, dynamic>> segments = [
    {
      "name": "Loyal Customers",
      "forecast": "ETB 550,000",
      "growth": "+5.2%",
      "color": Colors.green,
    },
    {
      "name": "New Customers",
      "forecast": "ETB 120,000",
      "growth": "+12.8%",
      "color": Colors.blue,
    },
    {
      "name": "Churned Customers",
      "forecast": "ETB 80,000",
      "growth": "-3.5%",
      "color": Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Segments")),
      body: ListView.builder(
        itemCount: segments.length,
        itemBuilder: (context, index) {
          final segment = segments[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: segment['color'],
              ),
              title: Text(segment['name'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Forecast: ${segment['forecast']}"),
              trailing: Text(
                segment['growth'],
                style: TextStyle(
                  color: segment['color'],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
