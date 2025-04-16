import 'package:flutter/material.dart';

class SalesDetailPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData = [
    {"month": "January", "actual": 10000, "forecast": 12000},
    {"month": "February", "actual": 11000, "forecast": 13000},
    {"month": "March", "actual": 12500, "forecast": 13500},
    {"month": "April", "actual": 14000, "forecast": 14500},
    {"month": "May", "actual": 15000, "forecast": 15500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Forecast Details"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Monthly Breakdown", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final item = salesData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.indigo),
                      title: Text(item["month"]),
                      subtitle: Text("Actual: \$${item["actual"]}  |  Forecast: \$${item["forecast"]}"),
                      trailing: Text(
                        ((item["forecast"] - item["actual"]) >= 0 ? "+" : "") +
                            "\$${(item["forecast"] - item["actual"]).toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (item["forecast"] - item["actual"]) >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
